import random

# 生成 1000 個數字
numbers = []
for _ in range(100):
    # 隨機選擇數字類型
    number_type = random.choice(['float', 'int', 'negative_float'])
    
    if number_type == 'float':
        num = round(random.uniform(-1000, 1000), random.choice([0, 1, 2, 3]))  # 隨機浮點數
    elif number_type == 'int':
        num = random.randint(-1000, 1000)  # 隨機整數
    else:  # 'negative_float'
        num = round(random.uniform(-1000, -1), random.choice([0, 1, 2, 3]))  # 隨機負浮點數
    
    numbers.append(str(num))

# 將數字寫入文本文件
file_path = 'test1.txt'  # 文件名
with open(file_path, 'w') as file:
    file.write(" ".join(numbers))

print(f"已生成 100 個數字並寫入 {file_path}")
