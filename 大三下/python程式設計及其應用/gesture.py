import cv2
import mediapipe as mp
import time
import pyautogui
import math

# 初始化 Mediapipe 手部模組
mp_hands = mp.solutions.hands
mp_drawing = mp.solutions.drawing_utils
hands = mp_hands.Hands(
    model_complexity=0,
    min_detection_confidence=0.5,
    min_tracking_confidence=0.5)

# 用來記錄先前手勢與時間，避免重複觸發
prev_gesture = ''          # 上一次偵測到的手勢（用來比對是否與目前相同）
gesture_start_time = 0     # 當前手勢開始被偵測到的時間（用來計算持續時間）
last_action_time = 0       # 上一次成功觸發手勢動作的時間（用來計算冷卻間隔）
cooldown = 1.5             # 手勢觸發的「冷卻時間」，單位秒（防止太頻繁觸發）

# 計算兩個向量之間的角度（2D）
def vector_2d_angle(v1, v2):
    try:
        angle = math.degrees(math.acos(
            (v1[0]*v2[0] + v1[1]*v2[1]) /
            (((v1[0]**2 + v1[1]**2)**0.5) * ((v2[0]**2 + v2[1]**2)**0.5))
        ))
    except:
        angle = 180  
    return angle

# 根據向量判斷方向（上、下、左、右）
def finger_direction(vec):
    x, y = vec
    angle = math.degrees(math.atan2(-y, x))  # 與x軸的夾角
    if -45 <= angle < 45:     # 指向右
        return 'right'
    elif 45 <= angle < 135:   # 指向上
        return 'up'
    elif angle >= 135 or angle < -135:  # 指向下
        return 'left'
    elif -135 <= angle < -45: # 指向下
        return 'down'
    return ''

# 計算五根手指的角度（大拇指到小拇指）
def hand_angle(hand_):
    a = vector_2d_angle
    return [
        a((hand_[0][0]-hand_[2][0], hand_[0][1]-hand_[2][1]), (hand_[3][0]-hand_[4][0], hand_[3][1]-hand_[4][1])),        # 大拇指
        a((hand_[0][0]-hand_[6][0], hand_[0][1]-hand_[6][1]), (hand_[7][0]-hand_[8][0], hand_[7][1]-hand_[8][1])),        # 食指
        a((hand_[0][0]-hand_[10][0], hand_[0][1]-hand_[10][1]), (hand_[11][0]-hand_[12][0], hand_[11][1]-hand_[12][1])),  # 中指
        a((hand_[0][0]-hand_[14][0], hand_[0][1]-hand_[14][1]), (hand_[15][0]-hand_[16][0], hand_[15][1]-hand_[16][1])),  # 無名指
        a((hand_[0][0]-hand_[18][0], hand_[0][1]-hand_[18][1]), (hand_[19][0]-hand_[20][0], hand_[19][1]-hand_[20][1]))   # 小指
    ]

# 根據手指角度與方向回傳對應的手勢名稱
def hand_pos(angle, hand_):
    f1, f2, f3, f4, f5 = angle
    thumb_vec = (hand_[4][0] - hand_[3][0], hand_[4][1] - hand_[3][1])  # 大拇指向量
    index_vec = (hand_[8][0] - hand_[7][0], hand_[8][1] - hand_[7][1])  # 食指向量

    # 大拇指比的方向（只有大拇指伸出）
    if f1 < 50 and f2 >= 50 and f3 >= 50 and f4 >= 50 and f5 >= 50:
        return 'thumb_' + finger_direction(thumb_vec)
    # 食指比的方向（只有食指伸出）
    elif f1 >= 50 and f2 < 50 and f3 >= 50 and f4 >= 50 and f5 >= 50:
        return 'point_' + finger_direction(index_vec)
    # 五指彎曲 (拳頭)
    elif all(f >= 50 for f in [f1, f2, f3, f4, f5]):
        return '0'
    # ok 手勢
    elif f2 >= 50 and f3 < 50 and f4 < 50 and f5 < 50:
        return 'ok'
    return ''

# 依據辨識手勢執行對應的動作
def trigger_action(gesture, mouse_control_mode=False):
    global prev_gesture, gesture_start_time, last_action_time
    current_time = time.time()

    # 滑鼠控制模式時，只處理 OK 手勢（開/關切換）
    if mouse_control_mode and gesture != 'ok':
        return

    # 若與上次相同手勢並持續維持超過 1 秒，且超過冷卻時間才觸發
    if gesture == prev_gesture and gesture != '':
        if gesture_start_time == 0:
            gesture_start_time = current_time
        elif (current_time - gesture_start_time >= 1 and     
              current_time - last_action_time > cooldown):  
            # 根據手勢執行不同按鍵動作
            if gesture == 'thumb_up':
                pyautogui.press('volumeup')     # 調大音量
            elif gesture == 'thumb_down':
                pyautogui.press('volumedown')   # 調小音量
            elif gesture == 'thumb_left':
                pyautogui.press('left')         # 快退影片
            elif gesture == 'thumb_right':
                pyautogui.press('right')        # 快進影片
            elif gesture == '0':
                pyautogui.press('space')        # 播放/暫停
            elif gesture == 'point_right':
                pyautogui.hotkey('shift', 'n')  # 下一部影片   
            elif gesture == 'point_left':
                pyautogui.hotkey('shift', 'p')  # 上一部影片
            elif gesture == 'ok':               # ok 手勢      a
                print("OK 手勢已用於模式切換，不觸發其他動作")

            print(f'✅ 手勢觸發：{gesture}')
            last_action_time = current_time
            gesture_start_time = 0
    else:
        # 記錄新的手勢與開始時間
        prev_gesture = gesture
        gesture_start_time = current_time if gesture else 0

# 處理每一幀影像：偵測手勢、執行動作、回傳處理後影像與手勢
def process_gesture_frame(frame, mouse_control_mode=False):
    if frame is None:
        return None, ''
    global hands, mp_drawing, mp_hands

    img = cv2.flip(frame, 1)  # 水平翻轉（自拍鏡頭）
    img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    results = hands.process(img_rgb)

    gesture = ''
    if results.multi_hand_landmarks:
        for hand_landmarks in results.multi_hand_landmarks:
            # 取出 21 個關鍵點的 (x, y) 座標
            finger_points = [(lm.x * img.shape[1], lm.y * img.shape[0]) for lm in hand_landmarks.landmark]
            # 計算各手指彎曲角度
            finger_angle = hand_angle(finger_points)
            # 根據角度判斷手勢
            gesture = hand_pos(finger_angle, finger_points)
            # 畫出手部骨架
            mp_drawing.draw_landmarks(img, hand_landmarks, mp_hands.HAND_CONNECTIONS)

    # 根據手勢執行對應行為
    trigger_action(gesture, mouse_control_mode)
    return img, gesture
