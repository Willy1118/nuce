import cv2
import numpy as np
import matplotlib.pyplot as plt

def dilation(image, kernel):
    h, w = image.shape # 圖片大小 h*w
    kernel_height, kernel_width = kernel.shape # kernel大小
    pad_height, pad_width = kernel_height // 2, kernel_width // 2 # padding值為(kernel size // 2)
    
    # 在上下左右填上0(若kernel size = 3，則在上下左右各延伸一像素) padding值為0(因為填充不應該影響原先的像素進行dilation)
    padded_image = np.pad(image, ((pad_height, pad_height), (pad_width, pad_width)), mode='constant', constant_values=0)

    #初始化output_image(全黑背景)
    output_image = np.zeros_like(image)
    
    # 遍歷整張圖
    for i in range(h):
        for j in range(w):
            # 以該點當最左上角，產生一個大小為kernel_size的window size
            window = padded_image[i:i + kernel_height, j:j + kernel_width]
            if (window * kernel).sum() > 0: # 當有碰到
                output_image[i, j] = 1 # 反白

    return output_image

def erosion(image, kernel):
    h, w = image.shape # 圖片大小 h*w
    kernel_height, kernel_width = kernel.shape # kernel大小
    pad_height, pad_width = kernel_height // 2, kernel_width // 2 # padding值為(kernel size // 2)
    
    # 在上下左右填上0(若kernel size = 3，則在上下左右各延伸一像素) padding值為1(因為填充不應該影響原先的像素進行erosion)
    padded_image = np.pad(image, ((pad_height, pad_height), (pad_width, pad_width)), mode='constant', constant_values=1)

    #初始化output_image(全白背景)
    output_image = np.ones_like(image)
    
    # 遍歷整張圖
    for i in range(h):
        for j in range(w):
            # 以該點當最左上角，產生一個大小為kernel_size的window size
            window = padded_image[i:i + kernel_height, j:j + kernel_width]
            if (window * kernel).sum() != kernel.sum(): # 當有碰到
                output_image[i, j] = 0 # 變黑

    return output_image

def opening(image, kernel):
    eroded = erosion(image, kernel)       # 先侵蝕
    opened = dilation(eroded, kernel)     # 再膨脹
    return opened

def closing(image, kernel):
    dilated = dilation(image, kernel)     # 先膨脹
    closed = erosion(dilated, kernel)     # 再侵蝕
    return closed

# 讀取binary.png並轉換為二值陣列
image = cv2.imread('binary.png', cv2.IMREAD_GRAYSCALE)
binary_image = np.where(image >= 128, 1, 0).astype(np.uint8)

# kernel
kernel = np.ones((5,5), np.uint8)

# 執行 Opening 和 Closing
opened_image = opening(binary_image, kernel)
closed_image = closing(binary_image, kernel)

# 顯示結果
plt.figure(figsize=(15, 5))

# 原始影像
plt.subplot(1, 3, 1)
plt.imshow(binary_image, cmap='gray')
plt.title("original")
plt.axis("off")

# Opening 結果
plt.subplot(1, 3, 2)
plt.imshow(opened_image, cmap='gray')
plt.title("Opening")
plt.axis("off")

# Closing 結果
plt.subplot(1, 3, 3)
plt.imshow(closed_image, cmap='gray')
plt.title("Closing")
plt.axis("off")

plt.show()
