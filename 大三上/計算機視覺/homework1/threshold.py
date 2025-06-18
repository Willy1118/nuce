import cv2
import numpy as np
from matplotlib import pyplot as plt

image = cv2.imread('lena.bmp', cv2.IMREAD_GRAYSCALE)

def local_mean_thresholding(image, window_size=15):
    # 如果影像是彩色的，轉換成灰階
    if len(image.shape) > 2:
        image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # 計算局部的平均強度
    local_mean = cv2.blur(image, (window_size, window_size))

    # 使用局部平均強度作為閾值進行二值化處理
    binary_image = np.where(image >= local_mean, 255, 0).astype(np.uint8)

    return binary_image # 返回圖片

def niblack_thresholding(image, window_size=15, k=-0.2):
    # 如果影像是彩色的，轉換成灰階
    if len(image.shape) > 2:
        image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # 計算局部的平均強度
    local_mean = cv2.blur(image, (window_size, window_size))

    # 計算局部的標準差
    local_sq_mean = cv2.blur(image**2, (window_size, window_size)) # 平方均值
    local_std_dev = np.sqrt(local_sq_mean - local_mean**2) # 局部的標準差

    # 計算 Niblack 閾值 T = μ + k * σ
    niblack_threshold = local_mean + k * local_std_dev

    # 使用 Niblack 閾值進行二值化處理
    binary_image = np.where(image >= niblack_threshold, 255, 0).astype(np.uint8)

    return binary_image #返回圖片

def otsu_thresholding(image):
    # Step 1: 計算正規化的histogram
    histogram, _ = np.histogram(image, bins=256, range=(0, 256))  # 計算直方圖
    histogram = histogram / float(np.sum(histogram))  # 計算機率分布

    # Step 2: 計算累積和 P1(k)
    P1 = np.cumsum(histogram)  # 前景累積機率

    # Step 3: 累積均值 m(k)
    mean_k = np.cumsum(histogram * np.arange(256))  # 累積均值(i*Pi)

    # Step 4: 計算全域均值 mG
    mG = mean_k[-1]  # 全域均值(mean_k的最後一項)

    # Step 5: 初始化變數
    max_sigma_b_squared = -np.inf  # 最大類間方差
    best_thresholds = []  # 用來存儲對應最大sigma_b_squared的閾值
    epsilon = 1e-10  # 避免除以0

    # Step 6: 遍歷所有可能的閾值
    for T in range(256):
        sigma_b_squared = ((mG * P1[T] - mean_k[T]) ** 2) / (P1[T] * (1 - P1[T]) + epsilon)
        
        # 如果找到新的最大sigma_b_squared，清除舊的最佳閾值，存入新的閾值
        if sigma_b_squared > max_sigma_b_squared:
            max_sigma_b_squared = sigma_b_squared
            best_thresholds = [T]
        
        # 如果sigma_b_squared等於當前最大值，將閾值加入列表
        elif sigma_b_squared == max_sigma_b_squared:
            best_thresholds.append(T)

    # 如果發現多個最佳閾值，返回它們的平均值
    if len(best_thresholds) > 1:
        best_otsu_threshold = np.mean(best_thresholds)
    else:
        best_otsu_threshold = best_thresholds[0]

    return best_otsu_threshold

def entropy_thresholding(image):
    # Step 1: 計算直方圖並正規化
    histogram, _ = np.histogram(image, bins=256, range=(0, 256))
    histogram = histogram / float(np.sum(histogram)) # 計算機率分布

    # Step 2: 計算前景和背景的累積機率
    P1 = np.cumsum(histogram)  # 前景累積機率
    P2 = 1 - P1  # 背景累積機率

    max_total_entropy = -np.inf
    best_entropy_threshold = 0  # 最佳閾值
    epsilon = 1e-10 # 避免log2(0)

    # Step 3: 遍歷所有可能的閾值
    for T in range(256):
        foreground_entropy = - (P1[T] * np.log2(P1[T] + epsilon) )  # foreground entropy
        background_entropy = - (P2[T] * np.log2(P2[T] + epsilon) )  # background entropy
        
        total_entropy = foreground_entropy + background_entropy
    
        # 找到最大total_entropy時的閾值
        if total_entropy > max_total_entropy:
            max_total_entropy = total_entropy
            best_entropy_threshold = T

    return best_entropy_threshold

local_mean_img = local_mean_thresholding(image)

niblack_img = niblack_thresholding(image)

otsu_threshold_value = otsu_thresholding(image)  # 獲取 Otsu 閾值
otsu_img = np.where(image >= otsu_threshold_value, 255, 0)  # 使用 Otsu 閾值進行二值化

entropy_threshold_value = entropy_thresholding(image) # 獲取 entropy 閾值
entropy_img = np.where(image >= entropy_threshold_value, 255, 0).astype(np.uint8) #使用 entropy 閾值進行二值化

# 顯示原圖和不同閾值方法的結果
plt.figure(figsize=(15, 5))
plt.subplot(1, 5, 1)
plt.title('Original Image')
plt.imshow(image, cmap='gray')

plt.subplot(1, 5, 2)
plt.title('Local method \n\nMean Threshold Image')
plt.imshow(local_mean_img, cmap='gray')

plt.subplot(1, 5, 3)
plt.title('Local method \nNiblack\'s threshold \n(k = -0.2)')
plt.imshow(niblack_img, cmap='gray')

plt.subplot(1, 5, 4)
plt.title(f'Global method \nOtsu algorithm \n(k={otsu_threshold_value})')
plt.imshow(otsu_img, cmap='gray')

plt.subplot(1, 5, 5)
plt.title(f'Global method \nEntropy Thresholding \n(T={entropy_threshold_value})')
plt.imshow(entropy_img, cmap='gray')


plt.show()
