def read_input(file_path):
    with open(file_path, 'r') as f:
        data = f.read().split()
    M = int(data[0])  # 背包容量
    n = int(data[1])  # 物品數量
    items = []
    for i in range(n):
        p = int(data[2 + 2 * i])
        w = int(data[2 + 2 * i + 1])
        items.append((p, w, i))  # 增加原始索引 i
    return M, n, items

def sort_items_by_ratio(items):
    n = len(items)
    for i in range(n):
        for j in range(0, n - i - 1):
            value1, weight1, _ = items[j]
            value2, weight2, _ = items[j + 1]
            ratio1 = value1 / weight1
            ratio2 = value2 / weight2
            if ratio1 < ratio2 or (ratio1 == ratio2 and weight1 < weight2):
                items[j], items[j + 1] = items[j + 1], items[j]
    return items

def generate_paths_with_pruning(M, n, items, best_ub):
    paths = []

    shared_best_ub = [best_ub]
    best_chose = None  # 用於記錄最佳選擇

    # 保存排序後與原始位置的對應關係
    original_indices = [item[2] for item in items]

    def dfs(path, depth):
        nonlocal best_chose
        current_path = "".join(path)

        # 計算當前路徑的上界和下界
        result = count_UB_LB(current_path, M, n, items, shared_best_ub[0])
        if result[0] is None:  # 如果返回的是 None，表示被剪枝
            print(f'Node: {current_path:<{n+1}} {result[1]}')
            return

        ub, lb, updated_best_ub, chose, _ = result
        shared_best_ub[0] = updated_best_ub

        # 將排序後的選擇轉回原始位置
        original_chose = ['0'] * n
        for idx, flag in enumerate(chose):
            original_chose[original_indices[idx]] = flag

        # 如果當前節點的上界是最佳的，更新最佳選擇
        if shared_best_ub[0] == ub:
            best_chose = original_chose

        paths.append((current_path, ub, lb, shared_best_ub[0], chose, original_chose))
        print(f"Node: {''.join(path):<{n+1}} UB={int(ub):<5} LB={int(lb):<5} best ub={int(shared_best_ub[0]):<5} "
              f"sorted_chose={''.join(chose)} original_chose={''.join(original_chose)}")

        if depth == n:
            return

        path.append('1')
        dfs(path, depth + 1)
        path.pop()

        path.append('0')
        dfs(path, depth + 1)
        path.pop()

    dfs(['1'], 1)
    dfs(['0'], 1)

    return paths, shared_best_ub[0], best_chose

def count_UB_LB(chose_state, M, n, items, best_ub):
    remain_weight = M
    chose = ['0'] * n
    ub = 0
    lb = 0

    for i in range(0, len(chose_state)):  
        if chose_state[i] == '1':  
            remain_weight -= items[i][1]
            ub += items[i][0]
            lb += items[i][0]
            chose[i] = '1'
    
    if remain_weight < 0:
        return None, "is not feasible, prune"

    ub_remain_weight = remain_weight
    lb_remain_weight = remain_weight
    
    for i in range(len(chose_state), n):
        if items[i][1] <= ub_remain_weight:
            ub_remain_weight -= items[i][1]
            ub += items[i][0]
            chose[i] = '1'

    for i in range(len(chose_state), n):
        if items[i][1] <= lb_remain_weight:
            lb_remain_weight -= items[i][1]
            lb += items[i][0]
        else:
            lb += int(items[i][0] * (lb_remain_weight / items[i][1]))
            lb_remain_weight = 0
        
    ub *= -1
    lb *= -1

    if lb >= best_ub:
        return None, f"UB={int(ub):<5} LB={int(lb):<5} => because lb ({lb}) >= best ub ({best_ub}), prune"
    
    if best_ub > ub:
        best_ub = ub

    return ub, lb, best_ub, chose, None

if __name__ == "__main__":
    input_file = "input5.txt"
    M, n, items = read_input(input_file)
    items = sort_items_by_ratio(items)
    print(f'經由調整後的陣列:先依照P/W排序，若一樣，依照weight排序，皆是從大到小')
    filtered_items = [(p, w) for p, w, _ in items]  
    print(filtered_items)
    print("\n第一個sorted chose是排序後的(方便debug)，第二個original chose是為排序前的選擇\n")

    root_ub, root_lb, best_ub, _, _ = count_UB_LB("", M, n, items, float('inf'))
    print(f'Node: {"root":<{n+1}} UB={int(root_ub):<5} LB={int(root_lb):<5}')

    pruned_paths, final_best_ub, best_chose = generate_paths_with_pruning(M, n, items, best_ub)

    # 顯示最佳結果
    print("\n最終結果:")
    print(f"最佳獲利: {-final_best_ub}") 
    print(f"最佳選擇: {''.join(best_chose)}")
