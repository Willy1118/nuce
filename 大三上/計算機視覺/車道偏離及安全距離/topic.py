import cv2
import numpy as np
import numpy as np
from ultralytics import YOLO

# 加載 YOLOv11 預訓練模型
model = YOLO('yolo11n.pt')

video_path = "test1.mp4"  
cap = cv2.VideoCapture(video_path)

# 假設相機的焦距和真實車輛寬度（米）
focal_length = 700  # 像素焦距
real_vehicle_width = 1.8  # 車輛實際寬度（米）

# 專注於機車和汽車的檢測類別
vehicle_classes = [2, 3]  # YOLOv11中，2是車(car)，3是機車(motorbike)

""" 使用 Canny 邊緣檢測 """
def canny_edge_detection(image):
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)  # 轉為灰階
    blur = cv2.GaussianBlur(gray, (5, 5), 0)        # 高斯模糊降噪
    edges = cv2.Canny(blur, 50, 100)                # Canny 邊緣檢測
    return edges

""" 提取感興趣區域 (ROI) """
def region_of_interest(image):
    height, width = image.shape[:2]
    # 定義多邊形mask的四個頂點
    polygon = np.array([[
        (int(width * 0.65), int(height * 0.7)),  # 右上角
        (int(width * 0.35), int(height * 0.7)),  # 左上角
        (int(width * 0.0), height),              # 左下角
        (width, height)                          # 右下角
    ]], dtype=np.int32)

    # 建立空白mask
    mask = np.zeros_like(image)
    
    # 在mask上填充梯形區域為白色
    cv2.fillPoly(mask, polygon, 255)

    # 應用mask
    masked_image = cv2.bitwise_and(image, mask)
    
    return masked_image

""" 根據檢測到的直線擬合左車道線和右車道線，選擇斜率最大的直線 """
def calculate_lines(image, lines):
    left_lines = []   # 儲存左車道線的斜率與截距
    right_lines = []  # 儲存右車道線的斜率與截距
    height, width, _ = image.shape

    if lines is not None:
        for line in lines:
            x1, y1, x2, y2 = line[0]
            # 檢查是否有垂直的直線 (防止除以零)
            if x2 - x1 != 0:
                slope = (y2 - y1) / (x2 - x1)  # 計算斜率
                intercept = y1 - slope * x1
                if abs(slope) > 0.3:  # 過濾掉幾乎水平的線條
                    if slope < 0 and x2 <= 0.51 * width:   # 左車道線 (斜率為負)
                        left_lines.append((slope, intercept))
                    elif slope > 0 and x2 >= 0.49 * width:  # 右車道線 (斜率為正)
                        right_lines.append((slope, intercept))

    # 選擇斜率最大的左車道線
    if left_lines:
        max_slope_line = left_lines[0]
        max_slope_value = abs(max_slope_line[0])
        for line in left_lines[1:]: 
            slope = abs(line[0])
            if slope > max_slope_value:
                max_slope_line = line
                max_slope_value = slope
        left_lines = [max_slope_line]

    # 選擇斜率最大的右車道線
    if right_lines:
        max_slope_line = right_lines[0]
        max_slope_value = abs(max_slope_line[0])
        for line in right_lines[1:]:
            slope = abs(line[0])
            if slope > max_slope_value:
                max_slope_line = line
                max_slope_value = slope
        right_lines = [max_slope_line]

    return left_lines, right_lines

""" 繪製車道線 """
def draw_lane_lines(image, left_lines, right_lines):
    height, width, _ = image.shape
    y1 = height  # 車道線起點 (靠近底部)
    y2 = int(height * 0.6)  # 車道線畫到的地方

    line_image = np.zeros_like(image)

    # 繪製左車道線
    if left_lines:
        slope, intercept = left_lines[0]
        x1 = int((y1 - intercept) / slope)
        x2 = int((y2 - intercept) / slope)
        cv2.line(line_image, (x1, y1), (x2, y2), (255, 0, 0), 10)

    # 繪製右車道線
    if right_lines:
        slope, intercept = right_lines[0]
        x1 = int((y1 - intercept) / slope)
        x2 = int((y2 - intercept) / slope)
        cv2.line(line_image, (x1, y1), (x2, y2), (0, 255, 0), 10)

    # 將車道線疊加到原圖上
    return cv2.addWeighted(image, 0.8, line_image, 1, 1)

""" 車道偏離 """
def check_lane_departure(frame, left_lines, right_lines):
    height, width, _ = frame.shape
    # 定義底部中間的參考點
    center_point = (int(width * 0.5), height - 10)
    
    direction = "Lane Normal"  # 預設為正常狀態

    # 設定容許誤差 (視為碰到車道線)
    epsilon = 10

    # 檢查是否碰到左車道線
    if left_lines:
        slope, intercept = left_lines[0]
        x_at_line = (center_point[1] - intercept) / slope
        distance = abs(center_point[0] - x_at_line)
        if distance <= epsilon:
            direction = "Lane Departure : Left"
    
    # 檢查是否碰到右車道線
    if right_lines:
        slope, intercept = right_lines[0]
        x_at_line = (center_point[1] - intercept) / slope
        distance = abs(center_point[0] - x_at_line)
        if distance <= epsilon:
            direction = "Lane Departure : Right"

    # 繪製參考點
    cv2.circle(frame, center_point, 8, (0, 0, 255), -1)  # 紅色圓點
    
    # 在影像上顯示車道偏移方向
    cv2.putText(frame, direction, (50, 50), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 255), 2)

    return frame

""" 繪製車道的三角形框 """
def define_lane_polygon(image, left_lines, right_lines):
   
    height, width, _ = image.shape
    y_bottom = height  # 影像底部
    y_top = int(height * 0.6)  # ROI 頂部
 
    line_image = np.zeros_like(image)
 
    # 確認左右車道線
    if left_lines and right_lines:
        left_slope, left_intercept = left_lines[0]
        right_slope, right_intercept = right_lines[0]
        
        # 計算交點
        x_inter = int((right_intercept - left_intercept) / (left_slope - right_slope))
        y_inter = int(left_slope * x_inter + left_intercept)

        # 計算左右線的底部的 x 座標
        x_left_bottom  = int((y_bottom - left_intercept) / left_slope)
        
        x_right_bottom = int((y_bottom - right_intercept) / right_slope)
        
        # 定義三角形的三個頂點
        triangle_points = np.array([
            [x_left_bottom, y_bottom],   # 左底部
            [x_right_bottom, y_bottom],  # 右底部
            [x_inter, y_inter]           # 左右線的交點
        ], dtype=np.int32)
        
        # 繪製多邊形
        cv2.polylines(line_image, [triangle_points], isClosed=True, color=(0, 255, 255), thickness=5)
    else:
        triangle_points = np.array([
            [0, 0],  # 左底部
            [0, 0],  # 右底部
            [0, 0]  # 左右線的交點
        ], dtype=np.int32)
    # 疊加到原影像
    return triangle_points

""" 車道線檢測主函數 """
def detect_lane_lines(frame, prev_left_lines, prev_right_lines):
    edges = canny_edge_detection(frame)  # 邊緣檢測
    cropped_edges = region_of_interest(edges)  # 提取 ROI
    # 霍夫變換提取直線
    lines = cv2.HoughLinesP(cropped_edges, rho=1, theta=np.pi / 180, threshold=100, 
                            minLineLength=100, maxLineGap=50)    

    # 計算左車道線與右車道線
    left_lines, right_lines = calculate_lines(frame, lines)

    # 如果本幀沒有檢測到車道線，使用上一幀的結果
    if not left_lines:
        left_lines = prev_left_lines
    if not right_lines:
        right_lines = prev_right_lines

    # 在原圖上繪製車道線
    result1 = draw_lane_lines(frame, left_lines, right_lines)

    # 執行偏移檢測
    result2 = check_lane_departure(frame, left_lines, right_lines)

    return result1, result2, cropped_edges, left_lines, right_lines

""" 定義估計距離的函數 """ 
def estimate_distance(bbox_width_pixels, focal_length, real_vehicle_width):
    return (focal_length * real_vehicle_width) / bbox_width_pixels

""" 車子或摩托車是否在裡面lane triangle """ 
def is_bbox_in_lane(xmin, ymin, xmax, ymax, lane_polygon):
    # 邊界框的四個角點座標
    corners = [
        (xmin, ymin),  # 左上
        (xmax, ymin),  # 右上
        (xmax, ymax),  # 右下
        (xmin, ymax)   # 左下
    ]
    
    # 檢查四個角點中是否有至少一點在多邊形內
    for corner in corners:
        if cv2.pointPolygonTest(lane_polygon, corner, False) >= 0:
            return True

    return False

if not cap.isOpened():
    print("無法開啟影片檔案！")
else:
    # 獲取影片的幀率 (frames per second)
    fps = cap.get(cv2.CAP_PROP_FPS)
    print(f"影片幀率: {fps} FPS")

    # 初始化前幀的車道線結果
    prev_left_lines = []
    prev_right_lines = []

    while cap.isOpened():
        ret, frame = cap.read()
        if not ret:
            print("讀取影片幀失敗或影片已播放完畢！")
            break
        # 車輛檢測
        results = model(frame)
        
        # 檢測車道線，並更新前幀結果
        lane_frame, department_frame, roi_frame, prev_left_lines, prev_right_lines = detect_lane_lines(
            frame, prev_left_lines, prev_right_lines
        )
        # 繪製車道區域
        lane_polygon = define_lane_polygon(frame, prev_left_lines, prev_right_lines)
        cv2.polylines(frame, [lane_polygon], isClosed=True, color=(0, 255, 0), thickness=3)

        # 提取車輛的邊界框並顯示距離
        notice_shown = False  # 用於控制是否顯示 "Notice"

        for box in results[0].boxes:
            xmin, ymin, xmax, ymax = box.xyxy[0].cpu().numpy()
            confidence = box.conf.cpu().numpy()
            cls = int(box.cls.cpu().numpy())

            bbox_width = xmax - xmin

            # 只處理汽車和機車類別
            if cls in vehicle_classes and is_bbox_in_lane(xmin, ymin, xmax, ymax, lane_polygon):
                if cls == 2:  # 汽車
                    real_vehicle_width = 1.8  # 假設機車的平均寬度約 1.8 米
                elif cls == 3:  # 機車
                     real_vehicle_width = 0.7  # 汽車的平均寬度約 0.7 米

                distance = estimate_distance(bbox_width, focal_length, real_vehicle_width)

                # 當車輛距離小於20米時顯示紅色框並顯示距離
                if distance < 20:
                    cv2.rectangle(frame, (int(xmin), int(ymin)), (int(xmax), int(ymax)), (0, 0, 255), 2)
                    cv2.putText(frame, f"{distance:.2f} m", (int(xmin), int(ymin) - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0, 0, 255), 2)
                else:
                    cv2.rectangle(frame, (int(xmin), int(ymin)), (int(xmax), int(ymax)), (255, 0, 0), 2)

                # 如果距離小於4米顯示Notice，並且避免重複顯示
                if distance < 4 and not notice_shown:
                    cv2.putText(frame, "Notice", (50, 100), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 2)
                    notice_shown = True  # 顯示後將標誌設置為True

        # 如果沒有車輛距離小於5米，顯示"Don't worry"
        if not notice_shown:
            cv2.putText(frame, "Don't worry", (50, 100), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 2)

        # 顯示結果
        # cv2.imshow("Region of Interest (ROI)", roi_frame)
        cv2.imshow("Detected Lane Lines", department_frame)

        # 按照影片的幀率設定延遲時間，這樣影片會以原速播放
        if cv2.waitKey(int(1000 / fps)) & 0xFF == ord('q'):  # 按下 'q' 鍵退出
            break

    cap.release()

# 關閉所有視窗
cv2.destroyAllWindows()

