import openpyxl                                # type:ignore
from openpyxl import Workbook                  # type:ignore
from datetime import datetime
import os
import tkinter as tk
from tkinter import messagebox
from PIL import Image, ImageTk
import random
import sys
import pandas as pd

# 結果狀態
RESULT_PUSH = 0               # 平手
RESULT_WIN  = 1               # 玩家贏
RESULT_LOSE = 2               # 玩家輸
RESULT_PLAYER_BLACKJACK = 3   # 玩家 Blackjack 贏
RESULT_PLAYER_FIVE_CARD = 4   # 玩家過5關

class BlackjackGame:
    """ 初始化遊戲主視窗和基本屬性 """
    def __init__(self, root, username="Willylai"):
        # 基本屬性初始化
        self.root = root
        self.username = username           # 取得使用者名字
        self.root.title(f"\U0001F3B0 Casino Blackjack 21 點 {self.username}")
        self.root.geometry("1200x700+0+0") # 設定視窗大小和位置
        self.root.configure(bg='#0b6623')  # 設定背景顏色(綠色)
        self.root.resizable(False, False)  # 禁止調整視窗大小

        # 遊戲狀態
        self.deck = []          # 牌堆
        self.player_hand = []   # 玩家手牌(用以計算點數)
        self.dealer_hand = []   # 莊家手牌(用以計算點數)
        self.chips = self.load_chips_from_excel(username) # 玩家籌碼
        self.bet = 0            # 當前下注金額 
        self.insurance = 0      # 保險金額
        self.start_game = False # 遊戲是否開始

        # UI 和圖片相關變數
        self.card_images = {}        # 儲存卡牌圖片
        self.card_labels_player = [] # 玩家卡牌標籤(用以顯示 UI)
        self.card_labels_dealer = [] # 莊家卡牌標籤(用以顯示 UI)  
        self.card_images_pil = {     # 載入卡牌圖片
            i: Image.open(f"images/poker/{i}.png").resize((150, 180), Image.LANCZOS) for i in range(1, 54)
        }

        self.setup_ui() # 創建遊戲使用者介面
    
    """ 從 Excel 載入玩家籌碼，若找不到則返回預設值 1000"""
    def load_chips_from_excel(self, username):
        try:
            df = pd.read_excel("user.xlsx")          # 讀取 Excel
            user_row = df[df['Username'] == username]  # 找到對應的用戶
            
            if not user_row.empty:                  # 如果有找到用戶
                return user_row['Chips'].values[0]  # 返回籌碼值
            else:
                return 1000  # 預設值
        
        except FileNotFoundError:  # 如果檔案不存在
            messagebox.showwarning("檔案不存在", "user.xlsx 檔案不存在，使用預設籌碼 1000")
            return 1000
        except Exception as e:  # 其他錯誤
            messagebox.showerror("讀取籌碼錯誤", f"讀取籌碼時發生錯誤: {str(e)}，使用預設籌碼 1000")
            return 1000
        
    """ 設置遊戲使用者介面 """
    def setup_ui(self):
        # 標題
        tk.Label(self.root, text="\U0001F3B0 Blackjack 21 點", fg='gold', bg='#0b6623',
                font=('Arial', 26, 'bold')).pack(pady=10)

        # 背景顏色
        self.root.configure(bg='#0b6623')

        # 莊家區塊
        self.label_dealer = tk.Label(self.root, text="莊家", bg='#0b6623', fg='white', font=('Arial', 16, 'bold'))
        self.label_dealer.pack(pady=(10, 0))
        self.frame_dealer = tk.Frame(self.root, bg='#0b6623', height=200) # 莊家卡牌顯示區域
        self.frame_dealer.pack(pady=10)

        # 玩家區塊
        self.label_player = tk.Label(self.root, text="玩家", bg='#0b6623', fg='white', font=('Arial', 16, 'bold'))
        self.label_player.pack(pady=(30, 0))
        self.frame_player = tk.Frame(self.root, bg='#0b6623', height=200) # 玩家卡牌顯示區域
        self.frame_player.pack(pady=10)

        # 右側 frame
        self.frame_controls = tk.Frame(self.root, bg='#0b6623')
        self.frame_controls.place(relx=0.82, rely=0.05)

        # 籌碼標籤顯示
        self.label_chips = tk.Label(self.frame_controls, text=f"籌碼：${self.chips}", fg='white', bg='#0b6623',
                                    font=('Arial', 18))
        self.label_chips.pack(pady=(0, 15))

        # 剩餘牌數顯示
        self.label_remaining_cards = tk.Label(self.frame_controls, text=f"剩餘牌數：52", fg='white', bg='#0b6623',
                                    font=('Arial', 14))
        self.label_remaining_cards.pack(pady=(0, 10))

        # 下注輸入框
        tk.Label(self.frame_controls, text="下注金額：", fg='white', bg='#0b6623', font=('Arial', 14)).pack(pady=5)
        self.entry_bet = tk.Entry(self.frame_controls, width=10, font=('Arial', 14))
        self.entry_bet.pack(pady=5)

        # 開始按鈕
        self.button_start = tk.Button(self.frame_controls, text="開始", command=self.start,
                                    font=('Arial', 14, 'bold'), bg='darkred', fg='white',
                                    width=10, height=2)
        self.button_start.pack(pady=15)

        # 要牌按鈕
        self.button_hit = tk.Button(self.frame_controls, text="要牌", command=self.hit, state=tk.DISABLED,
                                    font=('Arial', 14), bg='navy', fg='white', width=10, height=2)
        self.button_hit.pack(pady=10)

        # 停牌按鈕
        self.button_stand = tk.Button(self.frame_controls, text="停牌", command=self.stand, state=tk.DISABLED,
                                    font=('Arial', 14), bg='black', fg='white', width=10, height=2)
        self.button_stand.pack(pady=10)
        
        # 洗牌按鈕
        self.button_shuffle = tk.Button(self.frame_controls, text="洗牌", command=self.shuffle_deck,
                                      font=('Arial', 14), bg='purple', fg='white', width=10, height=2)
        self.button_shuffle.pack(pady=10)
        
        # 重新一局按鈕
        self.button_new_game = tk.Button(self.frame_controls, text="重新一局", command=self.new_game,
                                       font=('Arial', 14), bg='orange', fg='white', width=10, height=2, state=tk.DISABLED)
        self.button_new_game.pack(pady=10)
        
        # 結束遊戲按鈕
        self.button_quit = tk.Button(self.frame_controls, text="結束遊戲", command=self.quit_game,
                                    font=('Arial', 14), bg='darkred', fg='white', width=10, height=2)
        self.button_quit.pack(pady=10)

        self.create_deck()  # 創建並洗牌

    """ 離開遊戲 """
    def quit_game(self, event = None):
        self.root.destroy()
        os.execl(sys.executable, sys.executable, "main.py", "--back", username)

    """ 洗牌功能 """
    def shuffle_deck(self):
        random.shuffle(self.deck) 
        messagebox.showinfo("洗牌", "牌已重新洗過！")
    
    """ 重新一局 """
    def new_game(self):
        if messagebox.askyesno("重新一局", "牌數不足，確定要重新洗牌開始新遊戲嗎？"):
            self.create_deck() # 重新創建才組
            self.button_shuffle.config(state=tk.NORMAL)
            self.button_new_game.config(state=tk.DISABLED)
            messagebox.showinfo("重新一局", "牌堆已重新洗牌，可以開始新遊戲！")

    """ 創建並洗牌 """
    def create_deck(self):
        suits = ['♠', '♥', '♦', '♣'] # 四種花色
        # 創建52張牌 (例如：♠1, ♥3, ♦13, ♣7....)
        #self.deck = ['♠2', '♥2', '♦2', '♣2', '♣2']
        #self.deck = ['♠2', '♥2', '♦2', '♣2', '♣2']
        self.deck = [suit + str(value) for suit in suits for value in range(1, 14)]
        random.shuffle(self.deck)      # 洗牌
        self.update_remaining_cards()  # 更新剩餘牌數顯示
    
    """ 顯示剩餘牌數 """
    def update_remaining_cards(self):    
        remaining = len(self.deck)
        
        color = 'red' if remaining <= 10 else 'white' # 根據剩餘牌數改變文字顏色
        self.label_remaining_cards.config(text=f"剩餘牌數: {remaining}", fg=color) # 檢查是否需要啟用重新一局按鈕

    ''' 確認牌是否夠用 '''
    def check_card_count(self, context):
        # 遊戲開始前的檢查 
        if context == 'start':
            # 遊戲開始前檢查是否至少有4張牌(每人發2張)
            if len(self.deck) <= 4:
                messagebox.showwarning("牌數不足", f"牌堆數量不足，剩下{len(self.deck)}張，請重新洗牌！")
                return False
        # 遊戲進行時的檢查
        elif context == 'play':
            # 遊戲進行中若沒牌
            if len(self.deck) == 0:
                messagebox.showwarning("牌數不足", "牌堆數量剩餘0，直接統計成績！")
                self.update_ui(final=True)
                
                # 禁用按鈕防止進一步操作
                self.button_hit.config(state=tk.DISABLED)
                self.button_stand.config(state=tk.DISABLED)
                
                # 自動結算成績
                player_pts = self.calculate_points(self.player_hand)
                dealer_pts = self.calculate_points(self.dealer_hand)
                
                if player_pts > 21:
                    self.end_game(RESULT_LOSE, "💥 你爆掉了，輸了！")
                elif dealer_pts > 21:
                    self.end_game(RESULT_WIN,  "🎉 莊家爆掉了，你贏了！")
                elif player_pts > dealer_pts:
                    self.end_game(RESULT_WIN,  "🎉 你贏了！")
                elif dealer_pts > player_pts:
                    self.end_game(RESULT_LOSE, "💸 你輸了！")
                else:
                    self.end_game(RESULT_PUSH, "🤝 平手！")
                return False
        return True

    """ 將卡牌轉換為對應的圖片索引 """
    def card_to_index(self, card):
        # 根據花色決定基礎索引值
        suit_offset = {'♣': 0, '♦': 13, '♥': 26, '♠': 39}
        suit = card[0]        # 獲取花色(♣, ♦, ♥, ♠)
        value = int(card[1:]) # 獲取牌面值
        return suit_offset[suit] + value # 計算對應的圖片索引

    """ 獲取卡牌圖片(用以顯示) """
    def get_card_image(self, index):
        if index not in self.card_images:
            img = self.card_images_pil[index]
            self.card_images[index] = ImageTk.PhotoImage(img) # 使用 ImageTk.PhotoImage 顯示
        return self.card_images[index]
    
    """ 獲取卡牌圖片(用以動畫) """
    def get_card_images_pil(self, index):
        front = self.card_images_pil[index]
        back = self.card_images_pil[53]
        return front, back
    
    """ 計算手牌點數 """
    def calculate_points(self, hand):
        points = 0 # 點數
        aces = 0   # A的數量

        # 計算基本點數
        for card in hand:
            value = int(card[1:]) # 獲取牌面值
            if value == 1:    # A
                aces += 1     # A 個數 +1
                points += 11  # A 預設為11點
            elif value >= 10: # J, Q, K
                points += 10
            else:             # 2 ~ 9
                points += value
                
        # 處理A的點數調整(如果總點數超過21且手中有A)
        while points > 21 and aces > 0:
            points -= 10 # 將A從11點調整為1點
            aces -= 1
        return points

    """ 更新遊戲介面 """
    def update_ui(self, final=False):
        # 清除舊牌
        self.clear_cards()

        # 顯示玩家牌
        for card in self.player_hand:
            idx = self.card_to_index(card)  # 將 card 轉成 index
            img = self.get_card_image(idx)  # 載入卡片圖片
            lbl = tk.Label(self.frame_player, image=img, bg='#0b6623')
            lbl.pack(side=tk.LEFT, padx=2)
            self.card_labels_player.append(lbl)

        # 顯示莊家手牌
        # 如果是遊戲結束顯示全部牌，否則隱藏第二張(self.dealer_hand[0], "BACK")
        dealer_cards = self.dealer_hand if final else [self.dealer_hand[0], "BACK"]
        for card in dealer_cards:
            img = self.get_card_image(53) if card == "BACK" else self.get_card_image(self.card_to_index(card))
            lbl = tk.Label(self.frame_dealer, image=img, bg='#0b6623')
            lbl.pack(side=tk.LEFT, padx=2)
            self.card_labels_dealer.append(lbl)

        # 分數與籌碼更新
        self.label_chips.config(text=f"🎲 籌碼：${self.chips}")
        self.label_player.config(text=f"玩家：{self.calculate_points(self.player_hand)}點")
        self.label_dealer.config(text=f"莊家：{self.calculate_points(self.dealer_hand)}點" if final else "莊家")

    """ 開始新遊戲 """
    def start(self):
        # 若遊戲已經開始
        if self.start_game:
            return
        
        # 獲取下注金額並驗證
        try:
            self.bet = int(self.entry_bet.get())
            if self.bet <= 0:
                raise ValueError
            if self.bet > self.chips:
                messagebox.showerror("錯誤", "籌碼不足！")
                return
        except ValueError:
            messagebox.showerror("錯誤", "請輸入有效的下注金額")
            return 
        
        # 檢查牌數是否足夠
        if not self.check_card_count('start'):
            return  

        self.start_game = True
        self.insurance = 0
        self.player_hand = [self.deck.pop(), self.deck.pop()]  # 發初始玩家牌
        self.dealer_hand = [self.deck.pop(), self.deck.pop()]  # 發初始莊家牌
        # self.player_hand = ['♠10', '♠13']
        # self.dealer_hand = ['♣1', '♣6']

        self.update_remaining_cards()

        # 禁用按鈕和下注區
        self.button_hit.config(state=tk.DISABLED)
        self.button_stand.config(state=tk.DISABLED)
        self.button_start.config(state=tk.DISABLED)
        self.entry_bet.config(state=tk.DISABLED)
        self.button_shuffle.config(state=tk.DISABLED)  
        self.button_quit.config(state=tk.DISABLED)   
        self.button_new_game.config(state=tk.DISABLED)  
        
        self.clear_cards() # 清除舊牌

        # 卡牌流程控制用的步驟佇列
        steps = []

        # 玩家第 1 張
        c1 = self.player_hand[0]
        f1, b1 = self.get_card_images_pil(self.card_to_index(c1))
        l1 = tk.Label(self.frame_player, bg='#0b6623')
        l1.pack(side=tk.LEFT, padx=2)
        self.card_labels_player.append(l1)
        steps.append(lambda: self.flip_card(l1, b1, f1, callback=next_step))

        # 玩家第 2 張
        c2 = self.player_hand[1]
        f2, b2 = self.get_card_images_pil(self.card_to_index(c2))
        l2 = tk.Label(self.frame_player, bg='#0b6623')
        l2.pack(side=tk.LEFT, padx=2)
        self.card_labels_player.append(l2)
        steps.append(lambda: self.flip_card(l2, b2, f2, callback=next_step))

        # 莊家第 1 張
        c3 = self.dealer_hand[0]
        f3, b3 = self.get_card_images_pil(self.card_to_index(c3))
        l3 = tk.Label(self.frame_dealer, bg='#0b6623')
        l3.pack(side=tk.LEFT, padx=2)
        self.card_labels_dealer.append(l3)
        steps.append(lambda: self.flip_card(l3, b3, f3, callback=next_step))

        # 莊家第 2 張
        l4 = tk.Label(self.frame_dealer, bg='#0b6623')
        l4.pack(side=tk.LEFT, padx=2)
        self.card_labels_dealer.append(l4)
        
        # 在最後一步更新剩餘牌數並檢查牌堆狀態
        steps.append(lambda: (
            self.after_dealing_complete()
        ))

        """ 執行下一步驟 """
        def next_step():
            if steps:
                step = steps.pop(0)
                step()

        # 開始執行第一步
        next_step()
        
    """ 清除所有卡牌顯示 """
    def clear_cards(self):
        # 移除畫面上的卡片元件
        for lbl in self.card_labels_player: lbl.destroy()
        for lbl in self.card_labels_dealer: lbl.destroy()

        # 移除卡片列表裡面的東西
        self.card_labels_player.clear()
        self.card_labels_dealer.clear()

    """ 處理發完牌後的邏輯 """
    def after_dealing_complete(self):
        player_pts = self.calculate_points(self.player_hand) # 玩家點數
        dealer_pts = self.calculate_points(self.dealer_hand) # 莊家點數
        dealer_shows_ace = self.dealer_hand[0][1:] == '1'    # 莊家第一張是否為A

        # 玩家是BJ → 直接檢查莊家是否有BJ
        if player_pts == 21:
            self.update_ui(final=True) # 需顯示莊家第二張牌 
            if dealer_pts == 21:  # 莊家也有BJ → 平手
                self.flip_dealer_second_card(callback=lambda: 
                    self.end_game(RESULT_PUSH, "🤝 雙方都是 Blackjack，平手！"))
            else:                 # 莊家沒有BJ → 玩家贏(1.5倍籌碼)
                self.flip_dealer_second_card(callback=lambda: 
                    self.end_game(RESULT_PLAYER_BLACKJACK, f"🎉 你是 Blackjack，贏得1.5倍報酬 ${int(self.bet * 1.5)}！"))
            return                # 直接結束不處理後續邏輯

        # 玩家沒有BJ但莊家明牌是A → 詢問是否買保險
        if dealer_shows_ace:
            self.update_ui(final=False)   # 不需顯示莊家第二張牌 
            max_insurance = self.bet // 2 # 保險為籌碼的一半
            answer = messagebox.askyesno("保險選項", f"莊家明牌是 A，是否以 ${max_insurance} 購買保險？") # 詢問是否買保險
            self.insurance = max_insurance if answer else 0  # 0表示沒有購買保險

        # 情況3：莊家是BJ 玩家不是BJ
        if dealer_pts == 21:
            self.update_ui(final=True)    # 需要顯示莊家第二張牌
            ''' 莊家翻完第二張牌後執行 '''
            def after_flip():
                if self.insurance > 0:    # 當有購買保險時，莊家以2:1賠率陪保險
                    self.chips += self.insurance * 2
                    self.end_game(RESULT_LOSE, f"💥 莊家是 Blackjack！你贏得保險 ${self.insurance * 2}，但輸掉下注 ${self.bet}")
                else:                     # 當沒有購買保險時，玩家輸
                    self.end_game(RESULT_LOSE,  "💥 莊家是 Blackjack，你輸了！")
            self.flip_dealer_second_card(callback=after_flip) # 執行完動畫後再顯示結果
        # 情況4：正常遊戲流程
        else:
            self.update_ui(final=False)   # 不需顯示莊家第二張牌 
            if self.insurance > 0:        # 莊家沒有BJ但玩家買了保險 → 賠保險
                self.chips -= self.insurance
                messagebox.showinfo("保險結果", f"❌ 莊家不是 Blackjack，保險失敗，損失 ${self.insurance}")
                self.log_result_to_excel(
                    user_name="Willy", 
                    game="Blackjack", 
                    payout_ratio=0.5, 
                    chips=self.bet, 
                    win_or_lose="lose(賠了保險)")
            
            # 打開按鈕
            self.label_chips.config(text=f"🎲 籌碼：${self.chips}")
            self.button_hit.config(state=tk.NORMAL)
            self.button_stand.config(state=tk.NORMAL)

    """ 翻開莊家第二張牌 """
    def flip_dealer_second_card(self, callback=None):
        second_card_label = self.card_labels_dealer[1] # 第二張卡牌的label
        card = self.dealer_hand[1]                     # 第二張卡
        front_pil = self.card_images_pil[self.card_to_index(card)] # 取得第二張卡圖片(正面)
        back_img = self.card_images_pil[53]                        # 背面
        self.flip_card(second_card_label, back_img, front_pil, callback=callback) # 翻牌動畫

    """ 玩家抽牌 """
    def hit(self):
        # 抽一張牌並加入手牌
        new_card = self.deck.pop()
        self.player_hand.append(new_card)
        self.update_remaining_cards()  # 更新剩餘牌數顯示

        # 取得新牌正面的圖片
        front_pil = self.card_images_pil[self.card_to_index(new_card)]
        # 取得背面的圖片
        back_img = self.card_images_pil[53]

        # 建立一個空白 Label 放牌
        lbl = tk.Label(self.frame_player, bg='#0b6623')
        lbl.pack(side=tk.LEFT, padx=2)
        self.card_labels_player.append(lbl)

        ''' 翻完新牌後執行 '''
        def after_flip():
            self.update_ui(final=False)
            
            player_points = self.calculate_points(self.player_hand)
            
            # 檢查是否過五關 (拿到5張牌且沒爆牌)
            if len(self.player_hand) >= 5 and player_points <= 21:
                self.update_ui(final=True)
                
                ''' 莊家翻完第二張牌後執行 '''
                def after_dealer_flip():
                    self.end_game(RESULT_PLAYER_FIVE_CARD, f"🎉 過五關！你贏了2倍籌碼{self.bet*3}！")
                
                self.flip_dealer_second_card(callback=after_dealer_flip)
                return
                
            # 玩家爆掉時
            if player_points > 21:
                self.update_ui(final=True)
                
                ''' 莊家翻完第二張牌後執行 '''
                def after_dealer_flip():
                    self.end_game(RESULT_LOSE, "💥 你爆掉了，輸了！")
                
                self.flip_dealer_second_card(callback=after_dealer_flip)
            else:
                self.update_ui(final=False)
                
            if not self.check_card_count('play'):
                return
        
        # 先執行翻牌動畫
        self.flip_card(lbl, back_img, front_pil, callback=after_flip) 

    """ 判斷是否為軟17 """
    def is_soft_17(self, hand):
        ranks = [card[1:] for card in hand]
        if '1' not in ranks:
            return False

        # 移除一張 A（視為 11）
        ranks.remove('1')

        total = 0       # 剩餘牌數和
        for r in ranks:
            if r in ['11', '12', '13']:
                total += 10
            else:
                total += int(r)
        
        return total == 6  # 一張 A 當 11，其餘牌加起來剛好6 就是軟17

    """ 莊家抽牌 """
    def stand(self):
        # 玩家禁用要牌和停牌按鈕
        self.button_hit.config(state=tk.DISABLED)
        self.button_stand.config(state=tk.DISABLED)

        ''' 翻完莊家第二張再開始執行 '''
        def after_second_card_flip():
            self.root.after(300, dealer_play)

        # 先翻開莊家第二張
        self.flip_dealer_second_card(callback=after_second_card_flip)

        ''' 莊家抽牌邏輯 '''
        def dealer_play():
            dealer_pts = self.calculate_points(self.dealer_hand)

            # 當莊家爆牌、超過17點、硬17
            if dealer_pts > 21 or (dealer_pts > 17 or (dealer_pts == 17 and not self.is_soft_17(self.dealer_hand))):
                self.update_ui(final=True)
                player_pts = self.calculate_points(self.player_hand)

                if dealer_pts > 21:
                    self.end_game(RESULT_WIN, "🎉 莊家爆掉了，你贏了！")
                elif player_pts > dealer_pts:
                    self.end_game(RESULT_WIN, "🎉 你贏了！")
                elif dealer_pts == player_pts:
                    self.end_game(RESULT_PUSH, "🤝 平手！")
                else:
                    self.end_game(RESULT_LOSE, "💸 你輸了！")
                return

            # 莊家抽一張新卡並加入手牌
            # 檢查牌數是否足夠
            if not self.check_card_count('play'):
                return
            new_card = self.deck.pop()
            self.dealer_hand.append(new_card)
            self.update_remaining_cards()  # 更新剩餘牌數顯示

            # 取得新牌正面的圖片
            front_pil = self.card_images_pil[self.card_to_index(new_card)]
            # 取得背面的圖片
            back_img = self.card_images_pil[53]

            # 建立一個空白 Label 放牌
            lbl = tk.Label(self.frame_dealer, bg='#0b6623')
            lbl.pack(side=tk.LEFT, padx=2)
            self.card_labels_dealer.append(lbl)

            ''' 翻完新牌後 '''
            def after_flip():
                
                # 當玩家拿了5張且沒爆
                if len(self.dealer_hand) == 5 and self.calculate_points(self.dealer_hand) <= 21:
                    self.update_ui(final=True)
                    self.end_game(RESULT_LOSE, "💥 莊家拿滿五張且沒爆，莊家勝利！")
                else:
                    self.root.after(300, dealer_play)

            self.flip_card(lbl, back_img, front_pil, callback=after_flip)

    """ 結束遊戲後的統計與重置 """
    def end_game(self, result_code, message):
        # 計算賠率與籌碼變動
        payout_ratio = 0
        win_or_lose = "push"
        
        if result_code == RESULT_WIN:  # 贏
            self.chips += self.bet
            payout_ratio = 1
            win_or_lose = "win"
        elif result_code == RESULT_PLAYER_BLACKJACK:  # 玩家 BJ
            self.chips += int(self.bet * 1.5)
            payout_ratio = 1.5
            win_or_lose = "win"
        elif result_code == RESULT_LOSE:  # 輸
            self.chips -= self.bet
            payout_ratio = 1
            win_or_lose = "lose"
        elif result_code == RESULT_PLAYER_FIVE_CARD:  # 玩家五關
            self.chips += self.bet * 2
            payout_ratio = 2
            win_or_lose = "win"
        elif result_code == RESULT_PUSH:  # 平手
            payout_ratio = 0
            win_or_lose = "push"

        # 寫入 Excel 檔案
        self.log_result_to_excel(
            user_name=self.username,
            game="Blackjack",
            payout_ratio=payout_ratio,
            chips=self.bet,
            win_or_lose=win_or_lose
        )

        self.update_chips_in_excel()

        # 禁用按鈕
        self.button_hit.config(state=tk.DISABLED)
        self.button_stand.config(state=tk.DISABLED)

        # 顯示結果
        messagebox.showinfo("結果", message)

        # 重製設定
        self.start_game = False
        self.button_start.config(state=tk.NORMAL)
        self.entry_bet.config(state=tk.NORMAL)
        self.button_shuffle.config(state=tk.DISABLED if len(self.deck) <= 4 else tk.NORMAL)  # 若牌數>4啟用洗牌按鈕
        self.button_new_game.config(state=tk.NORMAL if len(self.deck) <= 4 else tk.DISABLED) # 若牌數>4禁用重新開始按鈕
        self.button_quit.config(state=tk.NORMAL)                                             # 啟用結束遊戲按鈕

        # 顯示最後結果
        self.update_ui(final=True)

    """ 寫入excel """
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
    
    """ 更新 user.xlsx 檔案中的 Chips 欄位 """
    def update_chips_in_excel(self):
        try:
            # 讀取 user.xlsx
            df = pd.read_excel('user.xlsx')
            
            # 找到對應的用戶名並更新 Chips 欄位
            df.loc[df['Username'] == self.username, 'Chips'] = self.chips
            
            # 寫回 Excel 檔案
            df.to_excel('user.xlsx', index=False)
            
        except Exception as e:
            print(f"更新 chips 時出錯: {e}")
            df = pd.DataFrame({
                'Username': [self.username],
                'Password': [''],
                'Chips': [self.chips],
                'CardID': [''],
                'CardPassword': [''],
                'Money': ['']
            })
            df.to_excel('user.xlsx', index=False)

    """ 執行卡牌翻轉動畫 """
    def flip_card(self, label, back_image, front_image, callback=None):
        steps = 10    # 動畫步驟數
        duration = 50 # 每步毫秒數

        # 複製正反面圖片用於動畫
        front_original = front_image.copy()
        back_original  = back_image.copy()

        """ 調整圖片大小並更新 """
        def resize_and_update(img_pil, ratio):
            w, h = 150, 180
            new_w = max(1, int(w * ratio))
            resized = img_pil.resize((new_w, h), Image.Resampling.LANCZOS)
            return ImageTk.PhotoImage(resized)

        """ 執行翻牌動畫 """
        def animate_flip(step=0):
            nonlocal label

            # 第一階段: 卡片從完整寬度縮小到一條線(背面)
            if   step < steps // 2:  
                ratio = 1 - (step / (steps // 2))
                img = resize_and_update(back_original, ratio)
                label.config(image=img)
                label.image = img
                self.root.after(duration, lambda: animate_flip(step + 1))
            # 第二階段: 切換到正面圖片
            elif step == steps // 2:
                img = resize_and_update(front_original, 0.01)
                label.config(image=img)
                label.image = img
                self.root.after(duration, lambda: animate_flip(step + 1))
            # 第三階段: 卡片從一條線擴展到完整寬度(正面)
            elif step <= steps:
                ratio = (step - steps // 2) / (steps // 2)
                img = resize_and_update(front_original, ratio)
                label.config(image=img)
                label.image = img
                self.root.after(duration, lambda: animate_flip(step + 1))
            else:
                if callback:
                    callback()

        # 執行翻牌動畫
        animate_flip()

if __name__ == "__main__":
    root = tk.Tk()             # 建立主視窗（tkinter 的 GUI 視窗）

    # 檢查是否有傳入 username 參數
    if len(sys.argv) > 1:
        username = sys.argv[1]
    else:
        username = "Willylai"

    game = BlackjackGame(root, username) # 傳入名字
    root.mainloop()                      # 啟動 tkinter 的事件主迴圈