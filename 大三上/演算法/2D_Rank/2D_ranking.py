# 調整heap，符合max-heap
def heapify(points, arr_len, i, axis):
    largest = i  # 這個節點為該子樹的最大節點
    left = 2 * i + 1  # 左兒子
    right = 2 * i + 2 # 右兒子

    # 左兒子跟largest的值比較，要注意調整heap時，不可以調整到已排序好的，所以left < arr_len
    if left < arr_len and points[left][axis] > points[largest][axis]:
        largest = left # 若較大，則設定largest為left

    # 右兒子跟largest的值比較，要注意調整heap時，不可以調整到已排序好的，所以right < arr_len
    if right < arr_len and points[right][axis] > points[largest][axis]:
        largest = right # 若較大，則設定largest為right

    # 如果最大的不是最初的根節點，則交換並繼續heapify
    if largest != i:
        points[i], points[largest] = points[largest], points[i] # 交換
        heapify(points, arr_len, largest, axis) # 繼續調整heap

# heap sort
def heapsort(points, axis):
    # 計算陣列長度
    arr_len = len(points)

    # 建立最大堆 (具有兒子的最大索引為 arrlen//2-1)，從此點到0進行heapify
    for i in range(arr_len // 2 - 1, -1, -1):
        heapify(points, arr_len, i, axis)

    # 一一取出元素
    for i in range(arr_len - 1, 0, -1):
        points[i], points[0] = points[0], points[i]  # 交換 root 和 最後節點 座標
        heapify(points, i, 0, axis)

# 找中位數
def find_median(points): 
    length = len(points)
    if length % 2 == 0:
        median = (points[length // 2][0] + points[length // 2 - 1][0]) / 2
    else:
        median = points[length // 2][0]
    return median

# 2D Ranking algorithm
def rank_2d(points, ranks):
    # 如果只有一個點，直接設定它的排名為 0
    if len(points) == 1:
        ranks[points[0][2]] = 0
        return

    # 找到 x 座標的中位數作為分割線
    median = find_median(points)

    # 將點分為 A (x 小於 median) 和 B (x 大於等於 median)
    A = [point for point in points if point[0] < median]
    B = [point for point in points if point[0] >= median]

    # 防止分割錯誤：確保 A 和 B 都至少有一個點
    if len(A) == 0:
        A = points[:len(points) // 2]
        B = points[len(points) // 2:]

    # 遞迴對 A 和 B 進行排名
    rank_2d(A, ranks)
    rank_2d(B, ranks)

    # 使用 heapsort 根據 y 座標排序 A 和 B， 1 表示根據 y 座標排序
    heapsort(A, 1)  
    heapsort(B, 1)

    # 遍歷 B 中的每個點，計算 A 中 y 值小於當前 B 點的點數
    a_index = 0
    count = 0
    for b in B:
        # 更新 a_index 和 count，找出 A 中所有 y 小於當前 b，且x座標不相等的點的總和
        while a_index < len(A) and A[a_index][1] < b[1] and A[a_index][0] != b[0]:
            count += 1
            a_index += 1
        ranks[b[2]] += count  # 累加 count 到 b 的排名


def main():
    points = []
    file_path = "test2.txt"
    
    # 讀取點的資料，並為每個點加入索引 (index)
    with open(file_path, 'r') as file:
        for index, line in enumerate(file):
            x, y = map(float, line.split())
            points.append((x, y, index))  # 把點(x, y)和對應的index一起存入points
    
    # 使用 x 座標排序
    heapsort(points, 0)
    ranks = {}  
    
    # 2D Ranking algorithm
    rank_2d(points, ranks)
    
    # 輸出結果
    print("Point (x, y) and Ranks:")
    for point in points:
        print(f"Point: ({point[0]:.2f}, {point[1]:.2f}) - Rank: {ranks[point[2]]}")
    
    # 計算統計數據
    total_points = len(points)
    max_rank = max(ranks.values())
    min_rank = min(ranks.values())
    avg_rank = sum(ranks.values()) / total_points

    # 輸出統計數據
    print(f"\n(1) 總點數: {total_points}")
    print(f"(2) 最大 Rank: {max_rank}")
    print(f"(3) 最小 Rank: {min_rank}")
    print(f"(4) 平均 Rank: {avg_rank:.2f}")

if __name__ == "__main__":
    main()
