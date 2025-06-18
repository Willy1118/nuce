import tkinter as tk
from tkinter import messagebox
import pandas as pd
import random
from PIL import Image, ImageTk
import openpyxl                                # type:ignore
from openpyxl import Workbook                  # type:ignore
from datetime import datetime
import os
import sys

class CasinoLoginApp:
    ''' 初始化 '''
    def __init__(self, root):
        self.root = root
        self.root.title("Perudo")           # 設定視窗標題
        self.root.geometry("1200x700+0+0")  # 設定視窗大小
        self.root.configure(bg="#0b6623")   # 設定背景顏色為綠色
        self.has_one_been_called = False    # 初始化1未被叫過
        
        # 載入骰子圖片
        self.dice_images = {}
        for i in range(1, 7):
            img = Image.open(f"images/dice/{i}.png")              # 開啟骰子圖片
            img = img.resize((80, 80), Image.LANCZOS)      # 調整圖片大小
            self.dice_images[i] = ImageTk.PhotoImage(img)  # 轉換為Tkinter可用的格式

        self.setup_login_page()  # 初始化玩家登入頁面

    ''' 初始化玩家登入畫面 '''
    def setup_login_page(self):
        # 清除現有視窗內容
        for widget in self.root.winfo_children():
            widget.destroy()

        self.root.configure(bg="#0b6623")  # 設定背景顏色

        # 玩家人數輸入區塊容器
        input_frame = tk.Frame(self.root, bg="#0b6623")
        input_frame.pack(pady=30)

        # 標題
        tk.Label(input_frame, text="🎲 請輸入玩家人數 (2~6)", 
                font=("Helvetica", 20, "bold"), fg="white", bg="#0b6623").pack(pady=10)

        # 玩家人數輸入框
        self.num_players_entry = tk.Entry(input_frame, width=5, justify="center", 
                                        font=("Helvetica", 18), fg="black", bg="white",
                                        bd=3, relief="groove")
        self.num_players_entry.pack(pady=5)

        # 確定按鈕
        tk.Button(input_frame, text="確定人數", font=("Helvetica", 16, "bold"),
                bg="gold", fg="black",
                command=self.set_player_count).pack(pady=10)

        # 登入框
        self.form_frame = tk.Frame(self.root, bg="#006400")  # 深綠色背景
        self.form_frame.pack(pady=20)

        self.entries = []        # 儲存所有輸入框
        self.player_frames = []  # 儲存所有玩家框架

        # 創建6個玩家輸入框（2行3列）
        for i in range(6):
            frame = tk.LabelFrame(self.form_frame, text=f"玩家 {i+1}", font=("Helvetica", 14, "bold"),
                                fg="gray", bg="#006400", bd=3, relief="ridge", padx=10, pady=10)
            frame.grid(row=i//3, column=i%3, padx=20, pady=20)
            self.player_frames.append(frame)

            # 帳號輸入框
            tk.Label(frame, text="帳號：", font=("Helvetica", 14), fg="gray", bg="#006400").grid(row=0, column=0, sticky="e")
            acc_entry = tk.Entry(frame, width=18, font=("Helvetica", 14), state="disabled",
                              disabledforeground="#ccc", disabledbackground="#888")
            acc_entry.grid(row=0, column=1, pady=5)

            # 密碼輸入框
            tk.Label(frame, text="密碼：", font=("Helvetica", 14), fg="gray", bg="#006400").grid(row=1, column=0, sticky="e")
            pwd_entry = tk.Entry(frame, width=18, font=("Helvetica", 14), show="*", state="disabled",
                              disabledforeground="#ccc", disabledbackground="#888")
            pwd_entry.grid(row=1, column=1, pady=5)

            self.entries.append((acc_entry, pwd_entry))  # 儲存帳號密碼輸入框

        # 按鈕框架（開始遊戲與結束遊戲）
        button_frame = tk.Frame(self.root, bg="#0b6623")
        button_frame.pack(pady=20)

        # 開始遊戲按鈕
        tk.Button(button_frame, text="開始遊戲", font=("Helvetica", 18, "bold"),
                  bg="gold", fg="black", command=self.start_game).pack(side="left", padx=20)

        # 結束遊戲按鈕
        tk.Button(button_frame, text="結束遊戲", font=("Helvetica", 18, "bold"),
                  bg="red", fg="white", command=self.quit_game).pack(side="left", padx=20)
    
    """ 設定玩家人數並啟用相應數量的輸入框 """
    def set_player_count(self):
        try:
            n = int(self.num_players_entry.get())  # 取得輸入的玩家人數
            if not (2 <= n <= 6):                  # 檢查是否在2-6之間
                raise ValueError
        except ValueError:
            messagebox.showerror("錯誤", "請輸入 2 到 6 的整數")
            return

        # 根據玩家人數啟用或禁用輸入框
        # acc:第i個人的帳號輸入框 pwd:第i個人的密碼輸入框
        for i, (acc, pwd) in enumerate(self.entries):
            frame = self.player_frames[i]
            if i < n:
                # 啟用輸入框
                acc.config(state="normal", foreground="black", background="white")
                pwd.config(state="normal", foreground="black", background="white")
                frame.config(fg="gold")           # 標題改為金色
                for child in frame.winfo_children():
                    if isinstance(child, tk.Label):
                        child.config(fg="white")  # 標籤文字改為白色
            else:
                # 禁用輸入框
                acc.delete(0, tk.END)
                pwd.delete(0, tk.END)
                acc.config(state="disabled", disabledforeground="#ccc", disabledbackground="#888")
                pwd.config(state="disabled", disabledforeground="#ccc", disabledbackground="#888")
                frame.config(fg="gray")          # 標題改為灰色
                for child in frame.winfo_children():
                    if isinstance(child, tk.Label):
                        child.config(fg="gray")  # 標籤文字改為灰色
    
    """ 驗證玩家帳號密碼並開始遊戲 """
    def start_game(self):    
        try:
            df = pd.read_excel("user.xlsx")  # 讀取用戶資料
        except Exception as e:
            messagebox.showerror("錯誤", f"無法讀取 user.xlsx：{e}")
            return

        usernames    = [] # 儲存有效輸入的玩家帳號密碼
        empty_errors = [] # 空欄位錯誤
        errors       = [] # 其他錯誤（重複、查無帳號、密碼錯誤）

        # 檢查所有啟用欄位是否有空白
        for i, (acc_entry, pwd_entry) in enumerate(self.entries):
            if acc_entry['state'] == 'disabled':
                continue

            index = i + 1
            username = acc_entry.get().strip()
            password = pwd_entry.get().strip()

            if not username or not password:
                empty_errors.append(f"玩家 {index} 的帳號或密碼尚未輸入")
            else:
                usernames.append((index, username, password))

        # 若有未輸入欄位，優先回報，終止流程
        if empty_errors:
            messagebox.showerror("錯誤", "\n".join(empty_errors))
            return

        # 檢查帳號是否重複
        name_dict = {}
        for idx, name, _ in usernames:
            name_dict.setdefault(name, []).append(idx)

        for name, idx_list in name_dict.items():
            if len(idx_list) > 1:
                players = "、".join([f"玩家 {i}" for i in idx_list])
                errors.append(f"{players} 帳號重複（{name}）")

        # 檢查帳號密碼是否正確
        for idx, username, password in usernames:
            row = df[df['Username'].astype(str) == username]
            if row.empty:
                errors.append(f"玩家 {idx} 查無此帳號：{username}")
            else:
                correct_password = str(row.iloc[0]['Password'])
                if str(password) != correct_password:
                    errors.append(f"玩家 {idx} 的密碼錯誤")

        # 若有任何錯誤顯示
        if errors:
            messagebox.showerror("登入失敗", "\n".join(errors))
            return

        # 驗證成功後，檢查餘額是否為 0
        self.player_data = []
        chip_errors = []
        for idx, username, _ in usernames:
            row = df[df['Username'].astype(str) == username]
            balance = row.iloc[0]['Chips']
            if balance <= 0:
                chip_errors.append(f"玩家 {idx}（{username}）的籌碼為 0，無法進入遊戲")
            else:
                self.player_data.append({
                    'index': idx,         # 玩家編號
                    'username': username, # 名字
                    'balance': balance,   # 餘額
                    'bet': 0,             # 賭注
                    'dice': [],           # 骰到的點數
                    'eliminated': False   # 淘汰狀態
                })

        # 若有籌碼錯誤
        if chip_errors:
            messagebox.showerror("無法開始", "\n".join(chip_errors))
            return

        self.current_player_index = 0 # 當前玩家索引
        self.show_transition_page()   # 顯示過渡頁面

    """ 離開遊戲 """
    def quit_game(self):
        # 關閉當前視窗
        self.root.destroy()
        
        # 重新啟動 main.py（完全替換當前進程）
        main_script_path = os.path.join(os.path.dirname(__file__), "main.py")
        os.execv(sys.executable, [sys.executable, main_script_path])

    """ 顯示玩家切換過渡頁面 """
    def show_transition_page(self):
        # 清除現有視窗內容
        for widget in self.root.winfo_children():
            widget.destroy()

        self.root.configure(bg="#0b6623")  # 綠色背景

        # 檢查是否只剩下一位玩家
        active_players = [p for p in self.player_data if not p['eliminated']]
        if len(active_players) == 1:   # 若只剩一個玩家
            winner = active_players[0] # 找到他即為優勝者
            messagebox.showinfo("遊戲結束", f"玩家 {winner['index']} ({winner['username']}) 獲勝！")
            self.setup_login_page()    # 回到最初始的登入畫面
            return

        # 找到下一位未被淘汰的玩家顯示過度頁面
        while True:
            player = self.player_data[self.current_player_index] 
            if not player['eliminated']: # 若沒被淘汰
                break
            # 若該玩家被淘汰，繼續往下個玩家找
            self.current_player_index = (self.current_player_index + 1) % len(self.player_data) 
        
        # 創建一個 frame
        frame = tk.Frame(self.root, bg="#0b6623")
        frame.pack(expand=True)

        # 顯示當前玩家編號
        tk.Label(frame, text=f"玩家 {player['index']} ({player['username']})", 
                font=("Helvetica", 30, "bold"), fg="white", bg="#0b6623").pack(pady=50)

        # 開始按鈕
        tk.Button(frame, text="開始", font=("Helvetica", 24, "bold"),
                 bg="gold", fg="black", command=self.show_player_turn_page).pack(pady=30)
    
    """ 顯示玩家回合頁面 """
    def show_player_turn_page(self):
        # 清除現有視窗內容
        for widget in self.root.winfo_children():
            widget.destroy()

        self.root.configure(bg="#0b6623") # 綠色背景

        # 取得當前玩家顯示擲骰區
        player = self.player_data[self.current_player_index]
        
        # 創建一個主要框架放置玩家資訊框架、下注區框架、下注按鈕框架、骰子區框架
        main_frame = tk.Frame(self.root, bg="#0b6623")
        main_frame.pack(expand=True, fill="both", padx=20, pady=20)

        # 玩家資訊框架
        info_frame = tk.Frame(main_frame, bg="#006400", bd=3, relief="ridge", padx=20, pady=10)
        info_frame.pack(fill="x", pady=10)

        tk.Label(info_frame, text=f"玩家 {player['index']} ({player['username']})", 
                font=("Helvetica", 20, "bold"), fg="white", bg="#006400").pack()

        # 下注區框架
        bet_frame = tk.Frame(main_frame, bg="#006400", bd=3, relief="ridge", padx=20, pady=10)
        bet_frame.pack(fill="x", pady=10)

        # 顯示玩家餘額
        tk.Label(bet_frame, text=f"當前餘額: {player['balance']}", 
                font=("Helvetica", 16), fg="gold", bg="#006400").pack(side="left", padx=20)

        # 下注輸入框
        tk.Label(bet_frame, text="輸入下注:", 
                font=("Helvetica", 16), fg="white", bg="#006400").pack(side="left", padx=(40, 5))

        self.bet_entry = tk.Entry(bet_frame, font=("Helvetica", 16), width=10)
        self.bet_entry.pack(side="left")
        self.bet_entry.insert(0, str(player['bet']))  # 顯示當前下注金額

        # 下注按鈕框架
        btn_frame = tk.Frame(bet_frame, bg="#006400")
        btn_frame.pack(side="left", padx=20)

        # 確認下注按鈕
        self.confirm_bet_btn = tk.Button(
            btn_frame, 
            text="確認下注", 
            font=("Helvetica", 14),
            bg="lightgreen", 
            command=lambda: self.toggle_bet_buttons(True))  # 禁用確認下注按鈕
        self.confirm_bet_btn.pack(side="left", padx=5)

        # 修改下注按鈕
        self.modify_bet_btn = tk.Button(
            btn_frame, 
            text="修改", 
            font=("Helvetica", 14),
            bg="lightgray", state="disabled", 
            command=lambda: self.toggle_bet_buttons(False)) # 啟用確認下注按鈕
        self.modify_bet_btn.pack(side="left", padx=5)

        # 骰子區框架
        dice_frame = tk.Frame(main_frame, bg="#0b6623")
        dice_frame.pack(pady=20)
        
        # 儲存骰子標籤
        self.dice_labels = []  
        dice_container   = tk.Frame(dice_frame, bg="#0b6623")
        dice_container.pack()
        
        # 初始化骰子顯示
        for i in range(5):
            dice_value = player['dice'][i] if len(player['dice']) > i else 1 # 初始化1點
            label = tk.Label(dice_container, image=self.dice_images[dice_value], bg="#0b6623")
            label.grid(row=0, column=i, padx=5)
            self.dice_labels.append(label)

        # 操作按鈕框架
        btn_frame = tk.Frame(main_frame, bg="#0b6623")
        btn_frame.pack(pady=20)

        # 根據是否有骰子結果決定按鈕狀態
        roll_state = "disabled"  # 初始狀態為禁用
        self.roll_button = tk.Button(
            btn_frame, 
            text="擲骰子", 
            font=("Helvetica", 16, "bold"),
            bg="gold",          # 金色背景
            fg="black",         # 黑色文字
            state=roll_state,   # 初始禁用
            command=self.start_dice_animation  # 點擊時觸發動畫
        )
        self.roll_button.pack(side="left", padx=20)

        confirm_state = "normal" if player['dice'] else "disabled"
        self.confirm_button = tk.Button(
            btn_frame, 
            text="確認完成", 
            font=("Helvetica", 16, "bold"),
            bg="lightblue",      # 淺藍色背景
            fg="black",          # 黑色文字
            state=confirm_state, # 根據骰子狀態決定
            command=self.confirm_player_turn  # 點擊後確認回合
        )
        self.confirm_button.pack(side="left", padx=20)

        # 初始化狀態
        self.animation_running = False  # 骰子動畫是否正在執行
        self.current_dice = player['dice'] if player['dice'] else [1]*5  # 當前骰子結果

    """ 切換下注、修改、骰骰子、完成確認按鈕狀態 """
    def toggle_bet_buttons(self, confirmed):
        # 確認下注
        if confirmed:
            try:
                bet = int(self.bet_entry.get())  # 取得下注金額
                if bet <= 0:
                    raise ValueError("下注必須大於0")
                if bet > self.player_data[self.current_player_index]['balance']:
                    raise ValueError("下注金額超過餘額")
                
                # 更新玩家下注金額
                self.player_data[self.current_player_index]['bet'] = bet

                self.confirm_bet_btn.config(state="disabled")  # 禁用確認按鈕
                self.modify_bet_btn.config(state="normal")     # 啟用修改按鈕
                self.bet_entry.config(state="readonly")        # 下注框設為只讀
                
                # 確認下注後，啟用擲骰子按鈕
                self.roll_button.config(state="normal")
            except ValueError as e:
                messagebox.showerror("錯誤", str(e))
        # 修改下注
        else:
            self.confirm_bet_btn.config(state="normal")   # 啟用確認按鈕
            self.modify_bet_btn.config(state="disabled")  # 禁用修改按鈕
            self.bet_entry.config(state="normal")         # 下注框設為可編輯
            self.roll_button.config(state="disabled")     # 修改下注時，禁用擲骰子按鈕

    """ 開始骰子動畫 """
    def start_dice_animation(self):
        # 若動畫在跑時，不執行，避免重複
        if self.animation_running:
            return
            
        # 禁用下注區按鈕、entry
        self.confirm_bet_btn.config(state="disabled")
        self.modify_bet_btn.config(state="disabled")
        self.bet_entry.config(state="disabled")
        
        self.animation_running = True                 # 設置動畫標記
        self.roll_button.config(state="disabled")     # 禁用擲骰子按鈕
        self.confirm_button.config(state="disabled")  # 禁用確認按鈕
        
        self.animation_counter = 0  # 動畫計數器
        self.animate_dice()         # 開始動畫
    
    """ 執行骰子動畫 """
    def animate_dice(self):
        if self.animation_counter == 10:  # 動畫執行10次
            self.finalize_dice()          # 結束動畫
            return
            
        # 隨機更新骰子圖片
        for i in range(5):
            random_value = random.randint(1, 6)
            self.dice_labels[i].config(image=self.dice_images[random_value])
            
        self.animation_counter += 1              # 計數器+1
        self.root.after(100, self.animate_dice)  # 延遲100毫秒後再次執行

    """ 確定最終骰子結果 """
    def finalize_dice(self):
        # 生成最終骰子結果
        self.current_dice = [random.randint(1, 6) for _ in range(5)]   
        
        # 更新骰子圖片
        for i, value in enumerate(self.current_dice):
            self.dice_labels[i].config(image=self.dice_images[value]) 
            
        self.animation_running = False              # 動畫結束
        self.roll_button.config(state="disabled")   # 禁用擲骰子按鈕
        self.confirm_button.config(state="normal")  # 啟用確認按鈕
        
        # 保存骰子結果到玩家資料
        self.player_data[self.current_player_index]['dice'] = self.current_dice
    
    """ 確認玩家回合完成 """
    def confirm_player_turn(self):
        # 移動到下一位玩家
        self.current_player_index = (self.current_player_index + 1) % len(self.player_data)
        
        # 檢查是否所有玩家都已完成
        all_done = True
        for player in self.player_data:
            if not player['eliminated'] and not player['dice']:
                all_done = False
                break
        
        if all_done:
            self.show_lottery_whirl()    # 所有玩家完成，顯示抽籤頁面
        else:
            self.show_transition_page()  # 顯示下一位玩家的過渡頁面

    """ 顯示抽籤頁面 """
    def show_lottery_whirl(self):
        # 清除現有視窗內容
        for widget in self.root.winfo_children():
            widget.destroy()

        self.root.configure(bg="#0b6623")  # 綠色背景
        
        # 創建主框架
        main_frame = tk.Frame(self.root, bg="#0b6623")
        main_frame.pack(expand=True, fill="both", padx=20, pady=20)
        
        # 抽籤標題
        tk.Label(main_frame, text="第一位叫骰的", font=("Helvetica", 24, "bold"), 
                 fg="gold", bg="#0b6623").pack(pady=(0, 30))
        
        # 創建玩家格子框架
        player_frame = tk.Frame(main_frame, bg="#0b6623", height=100)
        player_frame.pack(pady=(0, 20), fill="x", expand=True)
        
        # 創建玩家格子(未淘汰)
        self.labels = []
        active_players = [p for p in self.player_data if not p['eliminated']]
        
        spacing = 20      # 格子之間的間距
        
        # 創建一個內部框架來放置玩家標籤
        inner_frame = tk.Frame(player_frame, bg="#0b6623")
        inner_frame.place(relx=0.5, rely=0.5, anchor="center")
        
        # 將未被淘汰的玩家放入內部框架
        for i, player in enumerate(active_players):
            label = tk.Label(inner_frame, 
                            text=f"玩家 {player['index']}\n({player['username']})", 
                            width=15, height=3, 
                            bg='#CCCCCC', 
                            font=('Helvetica', 12, 'bold'),
                            relief="ridge", borderwidth=3)
            label.grid(row=0, column=i, padx=spacing//2)
            self.labels.append(label)
        
        # 創建開始按鈕框架
        button_frame = tk.Frame(main_frame, bg="#0b6623")
        button_frame.pack()
        
        # 創建開始按鈕
        self.button_core = tk.Button(button_frame, 
                                text="開  始", 
                                command=self.lottery_start, 
                                width=15, height=2, 
                                bg='#00CD00',
                                font=('Helvetica', 18, 'bold'),
                                relief="raised", borderwidth=5)
        self.button_core.pack(pady=20)
        
        # 轉盤狀態變量
        self.is_run = False        # 動畫未在跑
        self.current_highlight = 0 # 高光者

    """ 抽籤數值初始化 """
    def lottery_start(self):
        # 若動畫在跑時，不執行，避免重複
        if self.is_run:
            return
            
        self.is_run = True # 設置跑動畫=True
        
        for label in self.labels:
            label['bg'] = '#CCCCCC'
        
        # 從 self.player_data 獲取未被淘汰的玩家數量
        active_players = [p for p in self.player_data if not p['eliminated']]
        player_count = len(active_players)
        
        # 計算轉動次數，確保每個玩家被抽中的機率相同
        base_turns = 8 * player_count  
        extra_turns = random.randint(0, player_count-1)  # 隨機增加0到n-1次(每個玩家被抽中的機率相同)
        number = base_turns + extra_turns
        
        self.lottery_whirl(0, number)

    """ 開始抽籤動畫 """
    def lottery_whirl(self, i, number):
        # 若動畫在跑時，不執行，避免重複
        if not self.is_run:
            return
            
        # 移除上一個高亮(一開始時i=0，沒有上一個高亮)
        if i > 0:
            prev_index = (i-1) % len(self.labels)
            self.labels[prev_index]['bg'] = '#CCCCCC'
        
        # 設置當前高亮
        current_index = i % len(self.labels)
        self.labels[current_index]['bg'] = '#00CD00'
        
        # 根據總轉動次數計算三個階段
        stage1_end = number // 3       # 第一階段結束點
        stage2_end = number * 2 // 3   # 第二階段結束點
        
        # 計算等待時間（漸進式減速）
        if i < stage1_end:    # 初始快速階段
            wait = 100 + i*5
        elif i < stage2_end:  # 減速階段
            wait = 100 + stage1_end*5 + (i-stage1_end)*10
        else:                 # 最後慢速階段
            wait = 100 + stage1_end*5 + (stage2_end-stage1_end)*10 + (i-stage2_end)*20
        
        # 若還沒跑完動畫，繼續跑
        if i < number:
            self.root.after(wait, self.lottery_whirl, i + 1, number)
        # 跑完了
        else:
            self.is_run = False # 跑完動畫
            # 確定獲勝者
            active_players = [p for p in self.player_data if not p['eliminated']]
            winner_index = (number) % len(active_players)
            winner = active_players[winner_index]
            messagebox.showinfo("結果", f" {winner['username']} 是第一個喊的！")
            self.start_perudo_game(winner_index) # 大話骰遊戲介面

    """ 開始大話骰遊戲 """
    def start_perudo_game(self, first_player_index):  
        # 清除現有視窗內容
        for widget in self.root.winfo_children():
            widget.destroy()

        self.root.configure(bg="#0b6623")  # 綠色背景
        
        # 初始化遊戲狀態
        self.is_first_bid = True       # 是否為第一位喊的
        self.current_bid  = None       # 當前叫骰
        self.last_player_index = None  # 記錄上一位玩家
        self.current_player_index = first_player_index # 當前玩家是抽到的玩家

        # 創建主框架
        main_frame = tk.Frame(self.root, bg="#0b6623")
        main_frame.pack(expand=True, fill="both", padx=20, pady=20)

        # 標題與資訊區
        title_frame = tk.Frame(main_frame, bg="#0b6623")
        title_frame.pack(pady=10)

        # 顯示當前叫骰
        self.current_bid_label = tk.Label(
            title_frame, text="當前叫骰: 無", font=("Helvetica", 18, "bold"),
            fg="white", bg="#0b6623"
        )
        self.current_bid_label.pack(side="left", padx=10)

        # 顯示1是否為萬用點
        self.one_wild_label = tk.Label(
            title_frame, text="1是否為萬用點: 是", font=("Helvetica", 14, "bold"),
            fg="white", bg="#0b6623"
        )
        self.one_wild_label.pack(side="left", padx=10)

        # 玩家框架(存放未淘汰的)
        self.player_frames = []
        active_players = [p for p in self.player_data if not p['eliminated']]
        num_players = len(active_players)

        # 佈局方式(依照參與人數)
        if   num_players == 6: # 6人
            rows = [2, 2, 2]   # 三列，每列2個玩家
        elif num_players == 5: # 5人
            rows = [2, 2, 1]   # 前兩列各2個，最後一列1個
        elif num_players == 4: # 4人
            rows = [2, 2]      # 兩列，每列2個玩家
        elif num_players == 3: # 3人
            rows = [2, 1]      # 第一列各2個，第二列1個
        else:                  # 2人
            rows = [2]         # 一列，每列2個玩家

        # 所有未淘汰玩家框
        row_frame = tk.Frame(main_frame, bg="#0b6623")
        row_frame.pack(pady=10)

        # 初始化列計數器和每列玩家計數器
        current_row    = 0 # 當前處理的列索引
        players_in_row = 0 # 當前列已放置的玩家數量

        # 遍歷所有未淘汰的玩家
        for i, player in enumerate(active_players):
            # 檢查當前列是否已滿
            if players_in_row >= rows[current_row]:
                row_frame = tk.Frame(main_frame, bg="#0b6623") # 創建新列
                row_frame.pack(pady=10)
                current_row += 1   # 移動到下一列
                players_in_row = 0 # 重置當前列玩家計數

            # 玩家框
            fg_color = "gold" if i == first_player_index else "white"  # 初始顏色設定
            player_frame = tk.LabelFrame(
                row_frame, 
                text=f"玩家 {player['index']} ({player['username']})",
                font=("Helvetica", 14, "bold"),
                fg=fg_color,
                bg="#006400",
                bd=3,           # 邊框寬度
                relief="ridge", # 邊框樣式(脊狀)
                padx=10,
                pady=5
            )
            player_frame.pack(side="left", padx=10)
            self.player_frames.append(player_frame)

            # 創建骰子顯示區域
            dice_frame = tk.Frame(player_frame, bg="#006400")
            dice_frame.pack(pady=5)
            
            # 初始化骰子標籤列表
            dice_labels = []
            for j in range(5):
                # 創建骰子標籤，初始顯示1點
                label = tk.Label(dice_frame, image=self.dice_images[1], bg="#006400")
                label.grid(row=0, column=j, padx=2)
                dice_labels.append(label)

            # 叫骰框
            bid_frame = tk.Frame(player_frame, bg="#006400")
            bid_frame.pack(pady=5)

            # 叫骰數量輸入框
            self.bid_count_entry = tk.Entry(
                bid_frame, 
                width=3, 
                font=("Helvetica", 14), 
                state="normal" if i == first_player_index else "disabled")
            self.bid_count_entry.grid(row=0, column=0, padx=2)

            # 添加"個"字標籤
            tk.Label(bid_frame, text="個", font=("Helvetica", 14), bg="#006400", fg="white").grid(row=0, column=1, padx=2)

            # 叫骰點數輸入框
            self.bid_value_entry = tk.Entry(
                bid_frame, 
                width=3, 
                font=("Helvetica", 14), 
                state="normal" if i == first_player_index else "disabled") # 初始只有當前玩家可用
            self.bid_value_entry.grid(row=0, column=2, padx=2)
            
            # 創建"叫骰"按鈕
            self.bid_button = tk.Button(
                bid_frame, 
                text="叫骰", 
                font=("Helvetica", 12),
                bg="lightgreen", 
                state="normal" if i == first_player_index else "disabled", # 初始只有當前玩家可用 
                command=lambda idx=i: self.make_bid(idx)                   # 點擊時呼叫make_bid方法 
            )
            self.bid_button.grid(row=0, column=3, padx=5)

            self.catch_button = tk.Button(
                bid_frame, 
                text="抓", 
                font=("Helvetica", 12, "bold"),
                bg="red", 
                fg="white", 
                state="disabled",                         # 初始禁用
                command=lambda idx=i: self.catch_bid(idx) # 點擊時呼叫catch_bid方法 
            )
            self.catch_button.grid(row=0, column=4, padx=5)

            # 將 UI 元件保存到玩家資料中
            player['dice_labels']     = dice_labels          # 骰子標籤列表
            player['bid_count_entry'] = self.bid_count_entry # 數量輸入框
            player['bid_value_entry'] = self.bid_value_entry # 點數輸入框
            player['bid_button']      = self.bid_button      # 叫骰按鈕
            player['catch_button']    = self.catch_button    # 抓按鈕
            
            # 增加當前行玩家計數
            players_in_row += 1 

        # 保存活躍玩家列表
        self.active_players = active_players
    
    """ 玩家叫骰 """
    def make_bid(self, player_index):
        # 確認叫骰有符合規則
        try:
            count = int(self.active_players[player_index]['bid_count_entry'].get())
            value = int(self.active_players[player_index]['bid_value_entry'].get())

            # 若骰子點數沒有介於 1~6
            if not (1 <= value <= 6):
                raise ValueError("骰子點數必須在1到6之間")
            
            # 若骰子數量 > 總骰子數
            if count > 5 * len(self.active_players):
                raise ValueError(f"骰子數量不可以超過{5*len(self.active_players)}")
            
            # 第一次叫骰，骰子數量必須 >= 人數
            if self.is_first_bid:
                if count < len(self.active_players):
                    raise ValueError(f"第一次叫骰，數量必須至少為 {len(self.active_players)}")
                self.is_first_bid = False
            # 後續叫骰
            else:
                if self.current_bid:
                    # 取得前面叫骰的數量和點數
                    prev_count, prev_value = self.current_bid
                    
                    # 更改骰子點數時，數量必須 >= 上一家
                    if value != prev_value:
                        if count < prev_count:
                            raise ValueError(f"更改骰子點數時，數量必須至少為 {prev_count}")
                    # 骰子點數相同時，數量必須 >  上一家
                    else:
                        if count <= prev_count:
                            raise ValueError(f"相同骰子點數時，數量必須大於 {prev_count}")
                        
                    # 若骰子個數相同時，數量需要>上一家
                    if count == prev_count:
                        if value <= prev_value:
                            raise ValueError(f"相同骰子個數時，點數必須大於 {prev_value}")

            # 如果叫的是 1，就標記為 1 已經被叫過
            if value == 1:
                self.has_one_been_called = True

            # 叫骰成功時，更新到目前數量和點數
            self.current_bid = (count, value)
            self.current_bid_label.config(text=f"當前叫骰: {count}個{value}")
            
            # 更新1是否為萬用點
            self.one_wild_label.config(text=f"1是否為萬用點: {'是' if not self.has_one_been_called else '否'}")

            # 將叫骰的玩家禁用按鈕
            self.active_players[player_index]['bid_count_entry'].config(state="disabled")
            self.active_players[player_index]['bid_value_entry'].config(state="disabled")
            self.active_players[player_index]['bid_button'].config(state="disabled")

            # 將除了叫骰的玩家「抓」按鈕啟用
            for i, player in enumerate(self.active_players):
                player['catch_button'].config(state="normal" if i != player_index else "disabled")

            # 先儲存 last_player_index 再更新 current_player_index
            self.last_player_index = player_index
            self.current_player_index = (player_index + 1) % len(self.active_players)

            # 將下一位玩家的按鈕和輸入框啟用
            next_player = self.active_players[self.current_player_index]
            next_player['bid_count_entry'].config(state="normal")
            next_player['bid_value_entry'].config(state="normal")
            next_player['bid_button'].config(state="normal")

            # 更新所有玩家標題顏色(提示用)
            for i, player in enumerate(self.active_players):
                frame = self.player_frames[i]
                if i == self.current_player_index: # 當前玩家金色
                    frame.config(fg="gold")
                elif i == self.last_player_index:  # 上一個玩家番茄色
                    frame.config(fg="Tomato")
                else:                              # 其餘玩家白色
                    frame.config(fg="white")

        except ValueError as e:
            messagebox.showerror("錯誤", str(e))

    """ 玩家抓叫骰 """
    def catch_bid(self, player_index):
        # 當前沒有叫骰
        if not self.current_bid:
            messagebox.showerror("錯誤", "還沒有叫骰可以抓")
            return
        
        # 顯示所有骰子
        self.show_all_dice()
        
        total_count = 0                         # 骰子數量
        bid_count, bid_value = self.current_bid # 當前叫骰
        
        # 計算總骰子數量
        for player in self.active_players:
            for dice in player['dice']:
                # 當前骰子點數等於叫骰點數 或是 當前骰子點數是1且1沒有被叫過
                if dice == bid_value or (dice == 1 and not self.has_one_been_called):
                    total_count += 1
        
        catcher = self.active_players[player_index]                               # index 是抓的人
        bidder_index = (self.current_player_index - 1) % len(self.active_players) # 被抓的人是上一個喊的
        bidder = self.active_players[bidder_index]                                
        
        # 判斷勝負
        if total_count >= bid_count:  # 抓的人輸了
            loser = catcher
            winner = bidder
            result_message = f"實際有 {total_count}個{bid_value}，{catcher['username']} 抓錯了！\n"
        else:  # 喊的人輸了
            loser = bidder
            winner = catcher
            result_message = f"實際只有 {total_count}個{bid_value}，{bidder['username']} 吹牛！\n"
        
        # 計算轉移金額（輸家支付贏家的賭注金額）
        transfer_amount = winner['bet']
        
        # 先從輸家的 chips 扣除
        if loser['balance'] >= transfer_amount:
            loser['balance'] -= transfer_amount
            winner['balance'] += transfer_amount
            result_message += f"{loser['username']} 支付 {transfer_amount} 給 {winner['username']}"
        else:
            # 如果不夠，先扣 chips 餘額，再從 Money 扣
            remaining = transfer_amount - loser['balance']
            winner['balance'] += loser['balance']
            loser['balance'] = 0
            
            # 這裡需要從用戶的 Money 中扣除（需要訪問用戶數據庫）
            self.deduct_from_money(loser['username'], remaining)
            winner['balance'] += remaining
            result_message += f"{loser['username']} 支付 {transfer_amount} (其中 {remaining} 從 Money 扣除) 給 {winner['username']}"
        
        # 淘汰輸家
        loser['eliminated'] = True
        result_message += f"\n{loser['username']} 被淘汰！"
        messagebox.showinfo("結果", result_message)
        
        # 更新用戶 chips 到 Excel
        self.update_user_chips(winner['username'], winner['balance'])
        self.update_user_chips(loser['username'], loser['balance'])
        
        # 記錄遊戲結果到 game_log.xlsx
        self.log_perudo_result(winner['username'], loser['username'], winner['bet'])
        
        # 繼續遊戲或結束
        self.continue_after_catch()
    
    """ 顯示所有玩家的骰子並將點數框出 """    
    def show_all_dice(self):
        # 當前沒有叫骰
        if not self.current_bid:
            return
        
        # 取得當前叫骰的點數
        _, bid_value = self.current_bid
        
        # 遍歷所有玩家
        for player in self.active_players:
            for i, dice in enumerate(player['dice']):
                label = player['dice_labels'][i]           # 取得當前骰子標籤
                label.config(image=self.dice_images[dice]) # 將標籤改為骰子圖片
                
                # 當前骰子點數等於叫骰點數 或是 當前骰子點數是1且1沒有被叫過，就把他繪製紅色框
                is_called_value = (dice == bid_value) or (not self.has_one_been_called and dice == 1)
                if is_called_value:
                    label.config(relief="solid", bd=0, highlightbackground="red", highlightthickness=4)
                else:
                    label.config(relief="flat", bd=0, highlightbackground=None, highlightthickness=0)
    
    """ 抓完後是否繼續遊戲 """
    def continue_after_catch(self):
        # 重置1沒有被叫過
        self.has_one_been_called = False

        # 取得當前未被淘汰的玩家
        active_players = [p for p in self.player_data if not p['eliminated']]
        
        # 若只剩1位玩家
        if len(active_players) == 1:
            winner = active_players[0]
            messagebox.showinfo("遊戲結束", f"玩家 {winner['index']} ({winner['username']}) 獲勝！")
            self.setup_login_page() # 回到登入畫面
            return

        # 重置未淘汰者的骰子
        for player in self.player_data:
            if not player['eliminated']:
                player['dice'] = []

        try:
            self.current_player_index = next(i for i, p in enumerate(self.player_data) if not p['eliminated']) 
        except StopIteration:
            print("所有玩家都被淘汰了！")  # 或執行結束遊戲的邏輯

        self.show_transition_page()
    
    """ 更新用戶的 chips 到 user.xlsx """
    def update_user_chips(self, username, new_chips):
        
        try:
            # 讀取 user.xlsx
            df = pd.read_excel('user.xlsx')
            
            # 找到對應的用戶名並更新 Chips 欄位
            df.loc[df['Username'].astype(str) == username, 'Chips'] = new_chips
            
            # 寫回 Excel 檔案
            df.to_excel('user.xlsx', index=False)
            
        except Exception as e:
            messagebox.showerror("錯誤", f"更新 chips 時出錯: {e}")
            # 如果檔案不存在或格式錯誤，創建新檔案
            df = pd.DataFrame({
                'Username': [username],
                'Password': [''],
                'Chips': [new_chips],
                'Money': [0]
            })
            df.to_excel('user.xlsx', index=False)
    
    """ 從用戶的 Money 中扣除金額（當 chips 不足時）"""
    def deduct_from_money(self, username, amount):
        try:
            # 讀取 user.xlsx
            try:
                df = pd.read_excel('user.xlsx')
            except FileNotFoundError:
                df = pd.DataFrame(columns=['Username', 'Password', 'Chips', 'CardID', 'CardPassword', 'Money'])
            
            # 找到用戶並扣除 Money
            user_mask = df['Username'].astype(str) == username
            current_money = df.loc[user_mask, 'Money'].iloc[0]
            new_money = max(0, current_money - amount)  # 確保不會變成負數
            df.loc[user_mask, 'Money'] = new_money
            
            # 寫回 Excel
            df.to_excel('user.xlsx', index=False)
            return True  # 成功扣除
            
        except Exception as e:
            print(f"從 Money 扣除時出錯: {e}")
            # 如果出錯，創建一個新的 user.xlsx 並初始化該用戶
            df = pd.DataFrame({
                'Username': [username],
                'Password': [''],
                'Chips': [0],
                'CardID': [''],
                'CardPassword': [''],
                'Money': [0]
            })
            df.to_excel('user.xlsx', index=False)
            return False  # 扣除失敗

    """ 記錄 perudo 遊戲結果到 game_log.xlsx """
    def log_perudo_result(self, winner_name, loser_name, bet_amount):
        
        try:
            # 記錄贏家
            self.log_result_to_excel(winner_name, "perudo", 1, bet_amount, "win")
            # 記錄輸家
            self.log_result_to_excel(loser_name, "perudo", -1, bet_amount, "lose")
        except Exception as e:
            messagebox.showerror("錯誤", f"記錄遊戲結果時出錯: {str(e)}")
    
    """ 寫入 game_log.xlsx """
    def log_result_to_excel(self, user_name, game, payout_ratio, chips, win_or_lose):
        
        filename = "game_log.xlsx"
        time_str = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        
        if win_or_lose == "lose" or win_or_lose == "lose(賠了保險)":
            outcome = -1 * payout_ratio * chips
        else:
            outcome = payout_ratio * chips

        # 如果檔案不存在，就建立並加標題列
        if not os.path.exists(filename):
            wb = Workbook()
            ws = wb.active
            ws.title = "Log"
            ws.append(["user_name", "Time", "Game", "payout_ratio", "Chips", "WinOrLose", "Outcome"])
        else:
            wb = openpyxl.load_workbook(filename)
            ws = wb.active

        # 寫入一列紀錄
        ws.append([user_name, time_str, game, payout_ratio, chips, win_or_lose, outcome])

        # 儲存檔案
        wb.save(filename)

if __name__ == "__main__":
    root = tk.Tk()              # 創建主視窗
    app = CasinoLoginApp(root)  # 創建應用程式實例
    root.mainloop()             # 啟動主循環