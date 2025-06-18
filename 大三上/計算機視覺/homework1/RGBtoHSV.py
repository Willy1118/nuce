import numpy as np
import cv2
import matplotlib.pyplot as plt

def rgb_to_hsv(r, g, b): # RGB -> HSV
    r_prime = r / 255.0
    g_prime = g / 255.0
    b_prime = b / 255.0

    c_max = max(r_prime, g_prime, b_prime)
    c_min = min(r_prime, g_prime, b_prime)
    delta = c_max - c_min

    # RGB -> HSV
    # 計算 Hue
    if delta == 0:
        h = 0
    elif c_max == r_prime:
        h = 60 * (((g_prime - b_prime) / delta) % 6)
    elif c_max == g_prime:
        h = 60 * (((b_prime - r_prime) / delta) + 2)
    elif c_max == b_prime:
        h = 60 * (((r_prime - g_prime) / delta) + 4)

    # 計算 Saturation
    if c_max == 0:
        s = 0
    else:
        s = delta / c_max

    # 計算 Value 
    v = c_max

    return h, s, v

def hsv_to_rgb(h, s, v): # HSV -> RGB
    c = v * s
    h_prime = h / 60
    x = c * (1 - abs(h_prime % 2 - 1))
    
    if 0 <= h_prime < 1:
        r1, g1, b1 = (c, x, 0)
    elif 1 <= h_prime < 2:
        r1, g1, b1 = (x, c, 0)
    elif 2 <= h_prime < 3:
        r1, g1, b1 = (0, c, x)
    elif 3 <= h_prime < 4:
        r1, g1, b1 = (0, x, c)
    elif 4 <= h_prime < 5:
        r1, g1, b1 = (x, 0, c)
    elif 5 <= h_prime < 6:
        r1, g1, b1 = (c, 0, x)
    
    m = v - c
    r, g, b = (r1 + m) * 255, (g1 + m) * 255, (b1 + m) * 255
    
    return r, g, b

def gaussian_filter_2d(shape): # 高斯濾波(2D)數值計算
    m, n = [(ss-1)//2 for ss in shape] # m, n為產生網格用
    x, y = np.ogrid[-m:m+1, -n:n+1] # 產生網格座標 : 例如kernel_size = 3*3 -> (-1, -1) (0, -1) (1, -1) ......
    h = np.exp(-(x*x + y*y) / (2.*sigma*sigma)) # 公式計算
    h = h / (2. * np.pi * sigma * sigma) # 公式計算
    return h / h.sum() # Normalization

def apply_gaussian_to_v(hsv_image): # 將高斯濾波應用於v維度
    v_channel = hsv_image[:, :, 2] # 將HSV的V channel取出
    
    # 將高斯濾波應用於v維度
    gaussian_filter = gaussian_filter_2d((kernel_size, kernel_size))
    v_filtered = cv2.filter2D(v_channel, -1, gaussian_filter) # -1 : 輸出圖像的數據類型與輸入圖像相同
    
    hsv_filtered = hsv_image.copy() # 複製原圖片
    hsv_filtered[:, :, 2] = v_filtered # 將濾完波的V channel跟原本的H S合併
    return hsv_filtered

# 讀取圖像
image = cv2.imread('noise.bmp')  # 替換為你的圖像路徑
image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB) # BGR 色彩空間轉換為 RGB 

# RGB to HSV ， HSV 數值為小數
hsv_image = np.zeros_like(image, dtype=np.float32)
# 兩個for迴圈是指圖片大小
for i in range(image.shape[0]):
    for j in range(image.shape[1]):
        r, g, b = image[i, j] # 將RGB取出
        h, s, v = rgb_to_hsv(r, g, b)
        hsv_image[i, j] = [h, s, v]

kernel_size = 19
sigma = 3
# 將高斯濾波應用於v維度
hsv_filtered = apply_gaussian_to_v(hsv_image)

# HSV to RGB ， RGB為0-255的數值
filtered_image = np.zeros_like(image, dtype=np.uint8)                 
# 兩個for迴圈是指圖片大小
for i in range(hsv_filtered.shape[0]):
    for j in range(hsv_filtered.shape[1]):
        h, s, v = hsv_filtered[i, j] # 將HSV取出
        r, g, b = hsv_to_rgb(h, s, v)
        filtered_image[i, j] = [r, g, b]

# 顯示原圖和濾波後的圖
plt.figure(figsize=(10, 5))
plt.subplot(1, 2, 1)
plt.imshow(image)
plt.title('Original Image')

plt.subplot(1, 2, 2)
plt.imshow(filtered_image)
plt.title('RGB -> HSV')

plt.show()
