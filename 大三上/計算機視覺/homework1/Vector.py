import cv2
import numpy as np
import matplotlib.pyplot as plt

def vector_median_filter(image):
    h, w, c = image.shape # 獲取圖像的尺寸
    pad_size = kernel_size // 2 # padding用
    padded_image = cv2.copyMakeBorder(image, pad_size, pad_size, pad_size, pad_size, cv2.BORDER_REFLECT) # padding，使用BORDER_REFLECT的方法
    output_image = np.zeros_like(image) # 創建一個shape為 h*w*c 的全0陣列

    for i in range(h):
        for j in range(w):
            window = padded_image[i:i+kernel_size, j:j+kernel_size] # 獲取窗口(從填充的邊界算)
            window_vectors = window.reshape(-1, 3)  # 將窗口展平為每個像素的向量，以便計算歐式距離

            min_distance_sum = float('inf') # 距離總和
            median_vector = None # 初始化向量

            for v in window_vectors:
                # 計算距離總和
                distances = np.linalg.norm(window_vectors - v, axis=1)  # 使用歐氏距離(對於列 axis=1)
                distance_sum = np.sum(distances) # 距離總和

                if distance_sum < min_distance_sum: # 找出距離總和最小的
                    min_distance_sum = distance_sum
                    median_vector = v 

            output_image[i, j] = median_vector # 替換成距離總和最小的向量

    return output_image

# 讀取原始圖像
image = cv2.imread('noise.bmp')

# 設定窗口大小
kernel_size = 3

# 應用向量中值濾波
vector_median_image = vector_median_filter(image)

# 將圖像從 BGR 轉換為 RGB
image_rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
filtered_image_rgb = cv2.cvtColor(vector_median_image, cv2.COLOR_BGR2RGB)

# 顯示原圖和濾後圖像
plt.figure(figsize=(12, 6))

plt.subplot(1, 2, 1)
plt.imshow(image_rgb)
plt.title('Original Image')

plt.subplot(1, 2, 2)
plt.imshow(filtered_image_rgb)
plt.title('Vector (Median) filtering')

plt.show()