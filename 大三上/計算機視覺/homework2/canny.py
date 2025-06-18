import cv2
import numpy as np
import matplotlib.pyplot as plt

def convolve2d(image, kernel): # 手動卷積
    height, width = image.shape # 照片大小
    k_height, k_width = kernel.shape # kernel 大小
    pad_height, pad_width = k_height // 2, k_width // 2 # padding用，上下(kh // 2)，左右(kw // 2)
    # padding，使用reflect
    padded_img = np.pad(image, ((pad_height, pad_height), (pad_width, pad_width)), mode='reflect')
    result = np.zeros_like(image, dtype=float) # 輸出照片初始化為0
    
    # 卷積操作
    for x in range(height):
        for y in range(width):
            result[x, y] = np.sum(padded_img[x:x + k_height, y:y + k_width] * kernel) 
    
    return result

def gaussian_filter_2d(shape, sigma):  # 高斯濾波(2D)數值計算
    m, n = [(ss - 1) // 2 for ss in shape]  # m, n為產生網格用
    x, y = np.ogrid[-m:m + 1, -n:n + 1]  # 產生網格座標
    h = np.exp(-(x * x + y * y) / (2. * sigma * sigma))  # 公式計算
    h = h / (2. * np.pi * sigma * sigma)  # 公式計算
    return h / h.sum()  # Normalization

def gaussian_filter(image, sigma) : # 將圖片作用於高斯filter    
    kernel_size = int(6 * sigma + 1)
    if(kernel_size % 2 != 1): 
        kernel_size += 1 # 確保大小為奇數
    
    kernel = gaussian_filter_2d((kernel_size, kernel_size), sigma)  # 使用高斯濾波器
    smooth = convolve2d(image, kernel)  # 使用手動卷積
    return smooth

def gradient_magnitude_and_angle(image): # 計算magnitude和angle
    # 計算梯度x和y方向的梯度
    gx = convolve2d(image, np.array([[-1, -2, -1], [0, 0, 0], [1, 2, 1]]))  # x方向梯度
    gy = convolve2d(image, np.array([[-1, 0, 1], [-2, 0, 2], [-1, 0, 1]]))  # y方向梯度
    magnitude = np.sqrt(gx**2 + gy**2) # magnitude 計算
    angle = np.arctan2(gy, gx) * (180 / np.pi) # 將弧度轉成角度
    angle[angle < 0] += 180  # 將角度轉換為0到180度
    return magnitude, angle  # 將magnitude和angle回傳

def non_maxima_suppression(magnitude, angle): # 非最大值抑制
    height, width = magnitude.shape # 圖片大小
    suppressed = np.zeros_like(magnitude) # 初始值為0

    # 從(1,1)開始到(254,254)
    for x in range(1, height - 1):
        for y in range(1, width - 1):
            direction = angle[x, y] # 夾角，與x軸
            if direction < 22.5 or direction >= 157.5: # 垂直方向
                neighbors = [magnitude[x - 1, y], magnitude[x + 1, y]] # 選上下
            elif 22.5 <= direction < 67.5: # -45度角方向
                neighbors = [magnitude[x - 1, y - 1], magnitude[x + 1, y + 1]] # 選左上右下
            elif 67.5 <= direction < 112.5: # 水平方向
                neighbors = [magnitude[x, y - 1], magnitude[x, y + 1]] # 選左右
            else: # 45度角方向
                neighbors = [magnitude[x + 1, y - 1], magnitude[x - 1, y + 1]] # 選左下右上

            if magnitude[x, y] >= max(neighbors): # 如果magnitude > 兩個neighbors
                suppressed[x, y] = magnitude[x, y] # 保留，否則suppression(初始值本來就是0)

    return suppressed

def edge_determination(suppressed, low_threshold, high_threshold): # 邊緣確定
    height, width = suppressed.shape
    strong_edges = (suppressed >= high_threshold) # 強邊緣(存座標)
    weak_edges = (suppressed >= low_threshold) & (suppressed < high_threshold) # 弱邊緣 - 強邊緣 (存座標)

    #初始化0
    final_edges = np.zeros_like(suppressed)

    # 檢查所有點確認是否為強邊緣
    for x in range(1, height - 1): 
        for y in range(1, width - 1): 
            #如果為強邊緣
            if strong_edges[x, y]: 
                final_edges[x, y] = 255  # 強邊緣 = 255
                # 檢查周圍的弱邊緣(8-connectivity)
                for j in range(-1, 2):
                    for i in range(-1, 2):
                        if weak_edges[x + j, y + i]:  
                            final_edges[x + j, y + i] = 255  # 連接的弱邊緣 = 255

    return final_edges

def canny_edge_detection(image): # 所有步驟

    # 高斯平滑(step 1 : smoothing use Guassian)
    smoothed = gaussian_filter(image, sigma=1.4) # sigma = 1.4

    # 計算梯度值和角度(step 2 : Compute gradient magnitude and angle)
    magnitude, angle = gradient_magnitude_and_angle(smoothed)

    # 非最大值抑制(step 3 : Preserve edge points)
    suppressed = non_maxima_suppression(magnitude, angle)

    # 弱邊緣 強邊緣設定
    low_threshold = 30
    high_threshold = 60

    # 邊緣確認(step 4 : Edge determination)
    canny_img = edge_determination(suppressed, low_threshold, high_threshold)

    return canny_img

image = cv2.imread('lena.bmp', cv2.IMREAD_GRAYSCALE)  # 轉為灰階
canny_edges = canny_edge_detection(image) # canny

# 顯示結果
plt.figure(figsize=(10, 5))
plt.subplot(1, 2, 1)
plt.title("Original Image")
plt.imshow(image, cmap='gray')
plt.axis('off')

plt.subplot(1, 2, 2)
plt.title("Canny")
plt.imshow(canny_edges, cmap='gray')
plt.axis('off')

plt.show()
