import cv2 as cv
import mediapipe as mp
import numpy as np
import time
import math
import pyautogui

# variables
FONTS = cv.FONT_HERSHEY_COMPLEX
CLOSED_EYES_FRAME = 3
frame_counter = 0
CEF_COUNTER = 0
TOTAL_BLINKS = 0
LEFT_BLINKS = 0
RIGHT_BLINKS = 0
LOOK_LEFT = 0
LOOK_RIGHT = 0
last_action_time = 0
blink_start_time = None
look_left_start_time = None
look_right_start_time = None

# mediaPipe
mp_face_mesh = mp.solutions.face_mesh
face_mesh = mp_face_mesh.FaceMesh(
    static_image_mode=False,
    max_num_faces=1,
    refine_landmarks=True,
    min_detection_confidence=0.5,
    min_tracking_confidence=0.5
)

# landmark
LEFT_EYE = [362, 382, 381, 380, 374, 373, 390, 249, 263, 466, 388, 387, 386, 385, 384, 398]
RIGHT_EYE = [33, 7, 163, 144, 145, 153, 154, 155, 133, 173, 157, 158, 159, 160, 161, 246]
LEFT_IRIS = [468, 469, 470, 471, 472]
RIGHT_IRIS = [473, 474, 475, 476, 477]

# functions
def landmarksDetection(img, results, draw=False):
    h, w = img.shape[:2]
    mesh_coord = [(int(p.x * w), int(p.y * h)) for p in results.multi_face_landmarks[0].landmark]
    if draw:
        [cv.circle(img, p, 2, (0, 255, 0), -1) for p in mesh_coord]
    return mesh_coord

def euclaideanDistance(p1, p2):
    return np.linalg.norm(np.array(p1) - np.array(p2))

def blinkRatio(img, lm, eye_list):
    h_right, h_left = lm[eye_list[0]], lm[eye_list[8]] # h: horizontal
    v_top, v_bottom = lm[eye_list[12]], lm[eye_list[4]] # v: vertical
    h_distance = euclaideanDistance(h_right, h_left)
    v_distance = euclaideanDistance(v_top, v_bottom)
    return (h_distance / v_distance)

def draw_iris_circle(frame, lm, iris_ids, color):
    points = [lm[i] for i in iris_ids]
    if len(points) >= 3:
        center = tuple(np.mean(points, axis=0).astype(int))
        radius = int(np.mean([euclaideanDistance(center, p) for p in points]))
        cv.circle(frame, center, radius, color, 2)
        cv.circle(frame, center, 2, color, -1)
    

def look_left(landmarks, left_eye_indices, right_eye_indices, left_iris, right_iris, threshold=0.45):
    # 左眼
    left_eye_left = landmarks[left_eye_indices[0]]  # 362: 左眼內側
    left_eye_right = landmarks[left_eye_indices[8]]  # 263: 左眼外側
    # cv.circle(frame, left_eye_left, 5, (0, 0, 255), -1)  # 紅色：左眼內側
    # cv.circle(frame, left_eye_right, 5, (0, 255, 0), -1)  # 綠色：左眼外側
    left_points = [landmarks[i] for i in left_iris]
    left_iris_center_coord = tuple(np.mean(left_points, axis=0).astype(int))
    left_eye_width = euclaideanDistance(left_eye_left, left_eye_right)
    left_ratio = euclaideanDistance(left_iris_center_coord, left_eye_left) / left_eye_width

    # 右眼
    right_eye_left = landmarks[right_eye_indices[0]]
    right_eye_right = landmarks[right_eye_indices[8]]
    # cv.circle(frame, right_eye_left, 5, (0, 0, 255), -1)  # 紅色：右眼外側
    # cv.circle(frame, right_eye_right, 5, (0, 255, 0), -1)  # 綠色：右眼內側
    right_points = [landmarks[i] for i in right_iris]
    right_iris_center_coord = tuple(np.mean(right_points, axis=0).astype(int))
    right_eye_width = euclaideanDistance(right_eye_left, right_eye_right)
    right_ratio = euclaideanDistance(right_iris_center_coord, right_eye_left) / right_eye_width
    
    both_looking_left = (left_ratio < threshold) and (right_ratio < threshold)
    return both_looking_left, left_ratio, right_ratio

def look_right(landmarks, left_eye_indices, right_eye_indices, left_iris, right_iris, threshold=0.45):
    # 左眼
    left_eye_left = landmarks[left_eye_indices[0]]  # 362: 左眼內側
    left_eye_right = landmarks[left_eye_indices[8]]  # 263: 左眼外側
    # cv.circle(frame, left_eye_left, 5, (0, 0, 255), -1)  # 紅色：左眼內側
    # cv.circle(frame, left_eye_right, 5, (0, 255, 0), -1)  # 綠色：左眼外側
    left_points = [landmarks[i] for i in left_iris]
    left_iris_center_coord = tuple(np.mean(left_points, axis=0).astype(int))
    left_eye_width = euclaideanDistance(left_eye_left, left_eye_right)
    left_ratio = euclaideanDistance(left_iris_center_coord, left_eye_right) / left_eye_width

    # 右眼
    right_eye_left = landmarks[right_eye_indices[0]]
    right_eye_right = landmarks[right_eye_indices[8]]
    # cv.circle(frame, right_eye_left, 5, (0, 0, 255), -1)  # 紅色：右眼外側
    # cv.circle(frame, right_eye_right, 5, (0, 255, 0), -1)  # 綠色：右眼內側
    right_points = [landmarks[i] for i in right_iris]
    right_iris_center_coord = tuple(np.mean(right_points, axis=0).astype(int))
    right_eye_width = euclaideanDistance(right_eye_left, right_eye_right)
    right_ratio = euclaideanDistance(right_iris_center_coord, right_eye_right) / right_eye_width
    
    both_looking_right = (left_ratio < threshold) and (right_ratio < threshold)
    return both_looking_right, left_ratio, right_ratio

def process_iris_frame(frame):
    global frame_counter, CEF_COUNTER, TOTAL_BLINKS
    global LEFT_BLINKS, RIGHT_BLINKS, LOOK_LEFT, LOOK_RIGHT
    global last_action_time, blink_start_time, look_left_start_time, look_right_start_time

    frame_counter += 1
    frame = cv.flip(frame, 1)
    frame = cv.resize(frame, None, fx=1.5, fy=1.5)
    rgb_frame = cv.cvtColor(frame, cv.COLOR_BGR2RGB)
    results = face_mesh.process(rgb_frame)

    if results.multi_face_landmarks:
        mesh_coords = landmarksDetection(frame, results, draw=False)
        
        # ----------- 眨眼檢測 ----------
        left_ratio = blinkRatio(frame, mesh_coords, LEFT_EYE)
        right_ratio = blinkRatio(frame, mesh_coords, RIGHT_EYE)
        current_time = time.time()

        if left_ratio > 5.5 and right_ratio > 5.5:
            blink_start_time = blink_start_time or current_time
            if current_time - blink_start_time >= 1 and current_time - last_action_time >= 1:
                TOTAL_BLINKS += 1
                print(f'✅ 虹膜觸發：閉雙眼1秒')
                pyautogui.press('space')
                last_action_time = current_time
                blink_start_time = None
        elif left_ratio > 5.5 and right_ratio <= 5.5:
            blink_start_time = blink_start_time or current_time
            if current_time - blink_start_time >= 1 and current_time - last_action_time >= 1:
                LEFT_BLINKS += 1
                print(f'✅ 虹膜觸發：閉左眼1秒')
                pyautogui.press('left')
                last_action_time = current_time
                blink_start_time = None
        elif left_ratio <= 5.5 and right_ratio > 5.5:
            blink_start_time = blink_start_time or current_time
            if current_time - blink_start_time >= 1 and current_time - last_action_time >= 1:
                RIGHT_BLINKS += 1
                print(f'✅ 虹膜觸發：閉右眼1秒')
                pyautogui.press('right')
                last_action_time = current_time
                blink_start_time = None
        else:
            blink_start_time = None

        # ----------- 注視方向檢測 ----------
        looking_left, *_ = look_left(mesh_coords, LEFT_EYE, RIGHT_EYE, RIGHT_IRIS, LEFT_IRIS)
        looking_right, *_ = look_right(mesh_coords, LEFT_EYE, RIGHT_EYE, RIGHT_IRIS, LEFT_IRIS)

        if looking_left:
            look_left_start_time = look_left_start_time or current_time
            if current_time - look_left_start_time >= 1 and current_time - last_action_time >= 1:
                LOOK_LEFT += 1
                print(f'✅ 虹膜觸發：雙眼看向左邊1秒')
                pyautogui.hotkey('shift', 'p')
                last_action_time = current_time
                look_left_start_time = None
        else:
            look_left_start_time = None

        if looking_right:
            look_right_start_time = look_right_start_time or current_time
            if current_time - look_right_start_time >= 1 and current_time - last_action_time >= 1:
                LOOK_RIGHT += 1
                print(f'✅ 虹膜觸發：雙眼看向右邊1秒')
                pyautogui.hotkey('shift', 'n')
                last_action_time = current_time
                look_right_start_time = None
        else:
            look_right_start_time = None

        # ----------- 畫圖 ----------
        """draw_iris_circle(frame, mesh_coords, LEFT_IRIS, (0, 255, 255))
        draw_iris_circle(frame, mesh_coords, RIGHT_IRIS, (255, 255, 0))
        cv.polylines(frame, [np.array([mesh_coords[p] for p in LEFT_EYE], dtype=np.int32)], True, utils.GREEN, 1)
        cv.polylines(frame, [np.array([mesh_coords[p] for p in RIGHT_EYE], dtype=np.int32)], True, utils.GREEN, 1)"""

    return frame  # 回傳更新後的 frame（含標記）
