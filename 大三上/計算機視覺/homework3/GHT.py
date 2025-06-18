import numpy as np
import cv2
import math
import matplotlib.pyplot as plt

""" 建立R-table """ 
def build_R_table(template):
    
    edges = cv2.Canny(template, 100, 200) # 利用Canny進行邊緣檢測

    center = (template.shape[1] // 2, template.shape[0] // 2) # 定義參考點p(Xc, Yc)

    # 計算gradients角度
    grad_x = cv2.Sobel(edges, cv2.CV_64F, 1, 0, ksize=3)
    grad_y = cv2.Sobel(edges, cv2.CV_64F, 0, 1, ksize=3)
    angles = cv2.phase(grad_x, grad_y, angleInDegrees=True) # 以度數儲存

    # 初始化R-table
    R_table = {}

    # 將edge point(白色)存起來
    edge_points = np.argwhere(edges > 0)
    
    # 遍歷所有edge point
    for y, x in edge_points:
        phi = int(angles[y, x]) # key值(Φ)

        dx = x - center[0]      # 計算x到Xc的差
        dy = y - center[1]      # 計算y到Yc的差
        
        r = np.sqrt(dx**2 + dy**2) # 計算(Xc, Yc)到(x, y)的距離
        alpha = np.arctan2(dy, dx) # 計算alpha

        # 當phi沒在R-table時，創建一個屬於他的空向量
        if phi not in R_table:
            R_table[phi] = []
        
        # 將r跟alpha存在R-table
        R_table[phi].append((r, alpha))
       
    return R_table

""" Generalized Hough Transform """ 
def generalized_hough_transform(reference, r_table, theta_range):
    
    edges = cv2.Canny(reference, 100, 200) # 利用Canny進行邊緣檢測

    # 計算gradients角度
    grad_x = cv2.Sobel(edges, cv2.CV_64F, 1, 0, ksize=3)
    grad_y = cv2.Sobel(edges, cv2.CV_64F, 0, 1, ksize=3)
    angles = cv2.phase(grad_x, grad_y, angleInDegrees=True) # 以度數儲存

    h, w = reference.shape # 原圖(reference)大小
    theta_amount = (theta_range[1] - theta_range[0]) // theta_range[2] + 1 # 計算theta range間有多少角度
    accumulator = np.zeros((h, w, theta_amount)) # 投票陣列，大小為 h * w * theta_amount，初始化為0

    # 將edge point(白色)存起來
    edge_points = np.argwhere(edges > 0)
    
    # 遍歷所有edge point
    for y, x in edge_points:
        phi = int(angles[y, x])

        # 確認是否phi有在r_table
        if phi in r_table:
            for r, alpha in r_table[phi]: # 開始投票
                x_prime = r * math.cos(alpha) # x' = r*cos(α)
                y_prime = r * math.sin(alpha) # y' = r*cos(α)
                for theta_idx, theta in enumerate(range(*theta_range)):
                    theta_rad = math.radians(theta) # 將角度轉成弧度

                    # 計算 (x_c, y_c)
                    # Xc = x - (x'cos(θ) - y'sin(θ))
                    # Yc = y - (x'sin(θ) + y'cos(θ))
                    x_c = int(x - (x_prime * math.cos(theta_rad) - y_prime * math.sin(theta_rad)))
                    y_c = int(y - (x_prime * math.sin(theta_rad) + y_prime * math.cos(theta_rad)))

                    # 若(Xc, Yc)在圖片內(合理位置)
                    if 0 <= x_c < w and 0 <= y_c < h:
                        accumulator[y_c, x_c, theta_idx] += 1 # 為 accumulator[y_c, x_c, theta_idx]投票

    # 找到最適合的點(accumulator最多的)
    best_idx = np.unravel_index(np.argmax(accumulator), accumulator.shape)

    # 最佳點的座標(Xc, Yc)和角度
    best_match = (best_idx[1], best_idx[0], best_idx[2])

    return best_match

if __name__ == "__main__":

    # 讀入 Template.png 和 Reference.png
    template_path  = 'Template162.png'
    reference_path = 'Reference.png'
    template       = cv2.imread(template_path , cv2.IMREAD_GRAYSCALE)
    reference      = cv2.imread(reference_path, cv2.IMREAD_GRAYSCALE)
    original_image = cv2.imread(reference_path)

    # 讀入Template度數(為了輸出而已)
    degree = ''.join([char for char in template_path if char.isdigit()])

    # 建立 R-table
    r_table = build_R_table(template)

    # 度數範圍 (theta_min, theta_max, step)
    theta_range = (0, 360, 1)  # 0 ~ 359 degree , step = 1

    # 執行 GHT
    best_point = generalized_hough_transform(reference, r_table, theta_range)

    # 儲存最佳點的座標(Xc, Yc)和角度
    best_x, best_y, best_theta = best_point

    # 將偵測到的方框標出
    template_h, template_w = template.shape                               # 取得template的大小
    top_left     = (best_x - template_w // 2, best_y - template_h // 2)   # 方框左上角座標
    bottom_right = (best_x + template_w // 2, best_y + template_h // 2)   # 方框右下角座標
    cv2.rectangle(original_image, top_left, bottom_right, (255, 0, 0), 1) # 為original_image繪製方框，紅色，寬度是1

    # 顯示結果
    plt.figure(figsize=(16, 8))

    plt.subplot(1, 3, 1)
    plt.title(f"Template {degree}°")
    plt.imshow(template, cmap='gray')

    plt.subplot(1, 3, 2)
    plt.title("Input Image")
    plt.imshow(reference, cmap='gray')

    plt.subplot(1, 3, 3)
    plt.title(f"Detected Position")
    plt.imshow(original_image)
    plt.show()
