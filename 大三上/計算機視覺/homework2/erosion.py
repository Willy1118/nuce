import cv2
import numpy as np
import matplotlib.pyplot as plt

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
            if (window * kernel).sum() != kernel.sum(): # 當沒有全部碰到
                output_image[i, j] = 0 # 變黑

    return output_image

# 讀取binary.png並轉換為二值陣列
image = cv2.imread('binary.png', cv2.IMREAD_GRAYSCALE)
binary_image = np.where(image >= 128, 1, 0).astype(np.uint8)

# kernel
kernel = np.ones((5,5), np.uint8)

# 進行erosion
dilated_image = erosion(binary_image, kernel)

# 顯示原圖和結果
plt.figure(figsize=(10, 5))

# 顯示原圖
plt.subplot(1, 2, 1)
plt.imshow(binary_image, cmap='gray')
plt.title("original")
plt.axis("off")

# 顯示erosion後的圖像
plt.subplot(1, 2, 2)
plt.imshow(dilated_image, cmap='gray')
plt.title("Erosion")
plt.axis("off")

plt.show()
