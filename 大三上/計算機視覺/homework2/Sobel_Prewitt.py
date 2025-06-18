import cv2
import numpy as np
import matplotlib.pyplot as plt

# 讀取 lena.bmp 並轉換為灰階圖
image = cv2.imread('lena.bmp', cv2.IMREAD_GRAYSCALE)

# 定義 Sobel 卷積核
sobel_gx = np.array([[-1, -2, -1],
                    [ 0,  0,  0],
                    [ 1,  2,  1]])

sobel_gy = np.array([[-1, 0, 1],
                    [-2, 0, 2],
                    [-1, 0, 1]])

# 定義 Prewitt 卷積核
prewitt_gx = np.array([[-1, -1, -1],
                    [ 0,  0,  0],
                    [ 1,  1,  1]])

prewitt_gy = np.array([[-1, 0, 1],
                    [-1, 0, 1],
                    [-1, 0, 1]])

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

# 計算 Sobel 水平方向與垂直方向的梯度
sobel_x_grad = convolve2d(image, sobel_gx)
sobel_y_grad = convolve2d(image, sobel_gy)

# 計算 Sobel 梯度幅值
sobel_grad = np.sqrt(sobel_x_grad**2 + sobel_y_grad**2)

# 計算 Prewitt 水平方向與垂直方向的梯度
prewitt_x_grad = convolve2d(image, prewitt_gx)
prewitt_y_grad = convolve2d(image, prewitt_gy)

# 計算 Prewitt 梯度幅值
prewitt_grad = np.sqrt(prewitt_x_grad**2 + prewitt_y_grad**2)

# 顯示結果
plt.figure(figsize=(15, 6))

plt.subplot(1, 3, 1)
plt.title('Original Image')
plt.imshow(image, cmap='gray')

plt.subplot(1, 3, 2)
plt.title('Sobel')
plt.imshow(sobel_grad, cmap='gray')

plt.subplot(1, 3, 3)
plt.title('Prewitt')
plt.imshow(prewitt_grad, cmap='gray')

plt.show()
