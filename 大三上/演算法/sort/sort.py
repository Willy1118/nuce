# 讀入檔案並將數字存入array中
def read_numbers_from_file(file_path):
    with open(file_path, 'r') as file:
        # 讀取檔案內容，並將每個數字轉成float後存入array
        numbers = list(map(float, file.read().split()))
    return numbers

# 交換兩個數字
def swap(arr, exchange1, exchange2):
    tmp = arr[exchange1]
    arr[exchange1] = arr[exchange2]
    arr[exchange2] = tmp

# 快速排序法
def Quick_sort(arr, begin, end):

    # 代表分割未完成，繼續分割
    if begin < end:
        pk = arr[begin] # pk值
        i = begin   # 比較值索引
        j = end + 1 # 比較值索引
        
        # 一直找，直到i, j索引交會
        while True:

            # 一直找，找到i索引的值>pk值，或者超出最後一個索引時停止
            while True:
                i += 1
                if i >= end or arr[i] > pk:  
                    break

            # 一直找，找到j索引的值<pk值，或者超出第一個索引時停止
            while True:
                j -= 1
                if j <= begin or arr[j] < pk:  
                    break
            
            # 當還沒交會，交換i, j索引值；交會時結束
            if i < j:
                swap(arr, i, j)
            else:
                break
        
        # 將begin的值跟j的值交換，使begin的值在對的位置
        swap(arr, begin, j)

        # 分割(以j為分割線)
        Quick_sort(arr, begin, j - 1) # 分成左邊
        Quick_sort(arr, j + 1, end)   # 分成右邊

# 插入排序法
def Insert(arr, insert_number, insert_sorted):
    # j索引初始位置指向sorted array的最後一個位置(最大)
    j = insert_sorted - 1  

    # 當j索引不低於0且j索引的值 > 要插入的數字
    while j >= 0 and arr[j] > insert_number:  
        arr[j + 1] = arr[j] # j索引的值向後移
        j -= 1 # j後移繼續比

    #將要插入的數字寫到正確位置
    arr[j + 1] = insert_number

# 執行插入排序法   
def Insort(arr, n):
    # 1~最後一項
    for i in range(1, n):
        Insert(arr, arr[i], i)

# 印出資訊
def print_information(length, max, min):
    print("共有 " + str(length) + " 筆資料")
    print("最大的數: ", max)
    print("最小的數: ", min)

def main():
    file_path = 'test1.txt' 
    original_array = read_numbers_from_file(file_path) # 讀檔
    while True:
        array = original_array.copy() # 複製original array
        length = len(array)
        selection = int(input("請輸入以下數字進行操作:\n1. Quick sort\n2. Insertion sort\n3. Leave\n"))

        # 進行Quick sort
        if selection == 1:
            Quick_sort(array, 0, length - 1)
            print("進行Quick sort....\n排序後的陣列:")

        # 進行Insertion sort
        elif selection == 2:
            Insort(array, length)
            print("進行Insertion sort....\n排序後的陣列:")
        
        # 離開
        elif selection == 3:
            print("ending....")
            break
        else:
            print("請輸入1~3之間的數")

        # i為索引，num為陣列數字
        for i, num in enumerate(array):
            print(f"{num:<15g}", end=',')
            if (i + 1) % 5 == 0:
                print()
        print()

        # 印出資訊
        print_information(length, array[length - 1], array[0])

if __name__ == "__main__":
    main()
