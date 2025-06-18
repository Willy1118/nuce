import cv2
import mediapipe as mp
import pyautogui
import time
import math

# 初始化 Mediapipe 手部模組
mp_hands = mp.solutions.hands
hands = mp_hands.Hands(max_num_hands=1, min_detection_confidence=0.7)  
mp_draw = mp.solutions.drawing_utils                                   # 用來畫出手部骨架

# 取得螢幕解析度（用來對應滑鼠位置）
screen_width, screen_height = pyautogui.size()

# 初始化用於「靜止判斷」的變數
prev_x, prev_y = 0, 0                # 前一幀的座標（用來計算距離）
stay_start_time = None               # 停留開始時間
stay_threshold = 1.5                 # 停留幾秒才算點擊
movement_threshold = 20              # 容許移動範圍（像素）小於這個值才當作沒動

# 每一幀畫面處理函式：控制滑鼠、點擊判斷等
def process_mouse_frame(frame):
    global prev_x, prev_y, stay_start_time

    frame = cv2.flip(frame, 1)  
    img_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)  
    results = hands.process(img_rgb)  

    if results.multi_hand_landmarks:
        for hand_landmarks in results.multi_hand_landmarks:
            # 取得食指指尖的座標（索引值 8）
            index_finger_tip = hand_landmarks.landmark[8]
            h, w, _ = frame.shape
            cx, cy = int(index_finger_tip.x * w), int(index_finger_tip.y * h)  # 在畫面上的位置

            # 對應到螢幕座標，控制滑鼠移動
            screen_x = int(index_finger_tip.x * screen_width)
            screen_y = int(index_finger_tip.y * screen_height)
            pyautogui.moveTo(screen_x, screen_y)

            # 在畫面上畫一個圓標示食指指尖
            cv2.circle(frame, (cx, cy), 10, (255, 0, 255), cv2.FILLED)

            # 計算與前一幀的移動距離
            dist = math.hypot(cx - prev_x, cy - prev_y)

            if dist < movement_threshold:
                # 若手指幾乎沒移動
                if stay_start_time is None:
                    stay_start_time = time.time()  # 開始計時
                elif time.time() - stay_start_time > stay_threshold:
                    # 停留超過設定時間，觸發點擊
                    pyautogui.click()
                    print("Clicked!")
                    stay_start_time = None  # 重設計時
            else:
                # 有移動就重設時間
                stay_start_time = None

            # 更新上一幀的位置
            prev_x, prev_y = cx, cy

            # 畫出手部骨架
            mp_draw.draw_landmarks(frame, hand_landmarks, mp_hands.HAND_CONNECTIONS)

    return frame  # 回傳處理後的影像
