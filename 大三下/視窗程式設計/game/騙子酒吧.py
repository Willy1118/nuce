import openpyxl                               
from openpyxl import Workbook                  
from datetime import datetime
import os
import tkinter as tk
from tkinter import messagebox
from PIL import Image, ImageTk
import random
import sys
import pandas as pd

CARD_TYPES = ["星星", "太陽", "月亮"]
CARDS_PER_TYPE = 8
MAX_PLAY = 5

class Player:
    def __init__(self, name, is_human=False):
        self.name = name
        self.hand = []
        self.is_human = is_human

    def add_cards(self, cards):
        self.hand.extend(cards)

    def play_cards(self, indices):
        selected = [self.hand[i] for i in sorted(indices, reverse=True)]
        for i in sorted(indices, reverse=True):
            self.hand.pop(i)
        return selected

    def has_no_cards(self):
        return len(self.hand) == 0

class Game:
    def __init__(self, root, username="Guest"):
        self.root = root
        self.username = username
        self.root.title("騙子酒吧")
        self.root.geometry("1200x800+0+0")
        self.root.configure(bg="green")

        self.chips = self.load_chips_from_excel(username) # 玩家籌碼
        self.round = 1
        self.total_rounds = 4
        self.player_wins = 0

        self.start_screen()

    def start_screen(self):
        for widget in self.root.winfo_children():
            widget.destroy()

        self.start_frame = tk.Frame(self.root, bg="green")
        self.start_frame.pack(expand=True)

        tk.Label(self.start_frame, text="騙子酒吧", font=("Arial", 32), bg="green", fg="white").pack(pady=30)
        tk.Label(self.start_frame, text="點擊開始遊戲，將進行四局比賽", font=("Arial", 16), bg="green", fg="white").pack(pady=10)
       
        self.label_chips = tk.Label(self.start_frame, text=f"🎲 籌碼：${self.chips}", fg='white', bg='#0b6623',
                                    font=('Arial', 18))
        self.label_chips.pack(pady=(0, 15))

        tk.Label(self.start_frame, text="下注金額：", fg='white', bg='#0b6623', font=('Arial', 14)).pack(pady=5)
        self.entry_bet = tk.Entry(self.start_frame, width=10, font=('Arial', 14))
        self.entry_bet.pack(pady=5)

        self.start_button = tk.Button(self.start_frame, text="開始遊戲", font=("Arial", 18), command=self.start_game)
        self.start_button.pack(pady=20)

        self.button_quit = tk.Button(self.start_frame, text="🚪 結束遊戲", command=self.go_back,
                                    font=('Arial', 14), bg='darkred', fg='white', width=10, height=2)
        self.button_quit.pack(pady=10)

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
        

    def start_game(self):
        try:
            self.bet = int(self.entry_bet.get())
            if self.bet <= 0 or self.bet > self.chips:
                raise ValueError
        except:
            messagebox.showwarning("無效賭注", "請輸入有效的賭注（正整數，且不超過持有籌碼）")
            return
        
        self.chips -= self.bet
        self.update_user_chips()
        self.label_chips.config(text=f"🎲 籌碼：${self.chips}")

        self.start_frame.destroy()
        self.setup_round()

    def update_user_chips(self):
        try:
            df = pd.read_excel("user.xlsx")
            df.loc[df['Username'] == self.username, 'Chips'] = self.chips
            df.to_excel("user.xlsx", index=False)
        except Exception as e:
            messagebox.showerror("寫入錯誤", f"更新籌碼失敗: {e}")


    def setup_round(self):
        for widget in self.root.winfo_children():
            widget.destroy()

        self.target_card = random.choice(CARD_TYPES)
        self.players = [Player("你", is_human=True)] + [Player(f"電腦{i}") for i in range(1, 4)]
        self.turn = 0
        self.last_played = None
        self.play_history = []

        deck = CARD_TYPES * CARDS_PER_TYPE
        random.shuffle(deck)
        for i in range(len(deck)):
            self.players[i % 4].add_cards([deck[i]])

        script_dir = os.path.dirname(os.path.abspath(__file__))
        self.card_images = {
            card: ImageTk.PhotoImage(Image.open(os.path.join(script_dir, f"../images/liar/{card}.png")).resize((80, 120)))
            for card in CARD_TYPES
        }
        self.card_back = ImageTk.PhotoImage(Image.open(os.path.join(script_dir, "../images/liar/背面.png")).resize((80, 120)))
        self.card_back_rotated = ImageTk.PhotoImage(
            Image.open(os.path.join(script_dir, "../images/liar/背面.png")).resize((80, 120)).rotate(90, expand=True)
        )

        self.bottom_frame = tk.Frame(self.root, bg="green")
        self.bottom_frame.pack(side=tk.BOTTOM, pady=10)
        self.top_frame = tk.Frame(self.root, bg="green")
        self.top_frame.pack(side=tk.TOP, pady=10)
        self.left_frame = tk.Frame(self.root, bg="green")
        self.left_frame.pack(side=tk.LEFT, padx=10)
        self.right_frame = tk.Frame(self.root, bg="green")
        self.right_frame.pack(side=tk.RIGHT, padx=10)
        self.center_frame = tk.Frame(self.root, bg="green")
        self.center_frame.pack(expand=True)

        self.selection = []
        self.selected_buttons = []

        self.status_label = tk.Label(self.center_frame, text=f"本局目標：{self.target_card}", font=("Arial", 18), bg="green", fg="white")
        self.status_label.pack(pady=10)

        self.announce_label = tk.Label(self.center_frame, text=f"這局宣稱牌種：{self.target_card}", font=("Arial", 16), bg="green", fg="white")
        self.announce_label.pack()

        self.play_button = tk.Button(self.center_frame, text="出牌", command=self.play_selected_cards)

        self.catch_frame = tk.Frame(self.center_frame, bg="green")
        self.catch_yes = tk.Button(self.catch_frame, text="質疑是", command=lambda: self.resolve_catch(True))
        self.catch_no = tk.Button(self.catch_frame, text="質疑否", command=lambda: self.resolve_catch(False))
        self.catch_yes.pack(side=tk.LEFT, padx=10)
        self.catch_no.pack(side=tk.LEFT, padx=10)

        self.play_area = tk.Frame(self.center_frame, bg="green")
        self.play_area.pack(pady=10)

        self.update_ui()
        self.next_turn()


    def check_win(self):
        for player in self.players:
            if player.has_no_cards():
                if player.name == "你":
                    self.player_wins += 1
                    messagebox.showinfo("遊戲結果", f"你贏了第 {self.round} 局！")
                else:
                    messagebox.showinfo("遊戲結果", f"{player.name} 贏了第 {self.round} 局！")

                self.round += 1
                if self.round > self.total_rounds:
                    payout = int(self.player_wins * self.bet * 0.8)
                    self.chips += payout
                    self.save_game_log(payout) 
                    messagebox.showinfo("最終結果", f"四局結束！你總共贏了 {self.player_wins} 局，獲得 {payout} 籌碼獎勵！")
                    self.update_user_chips()
                    self.player_wins = 0
                    self.round = 1
                    self.start_screen()
                else:
                    self.root.after(1000, self.setup_round)
                return True
        return False

    def update_ui(self):
        for frame in [self.bottom_frame, self.top_frame, self.left_frame, self.right_frame, self.play_area]:
            for widget in frame.winfo_children():
                widget.destroy()

        self.selection.clear()
        self.selected_buttons.clear()

        tk.Label(self.bottom_frame, text="你", font=("Arial", 14), bg="green", fg="white").pack()
        hand_frame = tk.Frame(self.bottom_frame, bg="green")
        hand_frame.pack()
        for i, card in enumerate(self.players[0].hand):
            btn = tk.Button(hand_frame, image=self.card_images[card],
                            command=lambda i=i: self.select_card(i),
                            highlightbackground="black", highlightthickness=0)
            btn.grid(row=0, column=i)
            self.selected_buttons.append(btn)

        for idx, frame, rotation in zip([1, 2, 3], [self.left_frame, self.top_frame, self.right_frame], [90, 0, 90]):
            tk.Label(frame, text=self.players[idx].name, font=("Arial", 14), bg="green", fg="white").pack()
            hand_frame = tk.Frame(frame, bg="green")
            hand_frame.pack()
            for _ in self.players[idx].hand:
                lbl = tk.Label(hand_frame, image=self.card_back_rotated if rotation == 90 else self.card_back, bg="green")
                if rotation == 90:
                    lbl.pack(pady=2)
                else:
                    lbl.pack(side=tk.LEFT, padx=2)

    def select_card(self, index):
        if index in self.selection:
            self.selection.remove(index)
            self.selected_buttons[index].config(highlightbackground="black", highlightthickness=0)
        else:
            if len(self.selection) < MAX_PLAY:
                self.selection.append(index)
                self.selected_buttons[index].config(highlightbackground="red", highlightthickness=2)

    def play_selected_cards(self):
        if not self.selection:
            return

        selected_cards = self.players[0].play_cards(self.selection)
        self.display_played_cards(["背面"] * len(selected_cards), self.players[0].name)
        self.last_played = (0, selected_cards)
        self.play_history.append((0, selected_cards))
        if self.check_win(): return
        self.turn = (self.turn + 1) % 4
        self.play_button.pack_forget()
        self.catch_frame.pack_forget()
        self.root.after(500, self.next_turn)

    def display_played_cards(self, cards, player_name):
        for widget in self.play_area.winfo_children():
            widget.destroy()

        tk.Label(self.play_area, text=f"{player_name} 出牌（說是 {self.target_card}）:", bg="green", fg="white", font=("Arial", 12)).pack()
        for card in cards:
            img = self.card_images.get(card, self.card_back)
            lbl = tk.Label(self.play_area, image=img, bg="green")
            lbl.pack(side=tk.LEFT, padx=5)

    def next_turn(self):
        self.update_ui()
        current = self.turn
        player = self.players[current]

        if player.is_human:
            prev_player_idx = (self.turn - 1) % 4
            self.status_label.config(text=f"你的回合")

            if self.last_played and not self.players[self.last_played[0]].is_human:
                self.catch_frame.pack(pady=5)
            else:
                self.catch_frame.pack_forget()

            self.play_button.pack(pady=5)
        else:
            self.catch_frame.pack_forget()
            self.play_button.pack_forget()

            prev_player_idx = (self.turn - 1) % 4
            if self.last_played and self.players[self.last_played[0]].is_human:
                if self.should_catch(player):
                    self.resolve_catch(True, computer_catcher=True)
                    return

            played_cards = self.computer_play(player, current)
            self.last_played = (current, played_cards)
            self.play_history.append((current, played_cards))
            if self.check_win(): return
            self.turn = (self.turn + 1) % 4
            self.root.after(1000, self.next_turn)

    def computer_play(self, player, index):
        possible_indices = [i for i, c in enumerate(player.hand) if c == self.target_card]
        if possible_indices and random.random() < 0.7:
            play_count = min(len(possible_indices), 3)
            selected = random.sample(possible_indices, play_count)
        else:
            all_indices = list(range(len(player.hand)))
            play_count = min(len(all_indices), 3)
            selected = random.sample(all_indices, play_count)

        played = player.play_cards(selected)
        self.display_played_cards(["背面"] * len(played), player.name)
        return played

    def should_catch(self, player):
        idx, cards = self.last_played
        if not cards: return False
        true_cards = all(card == self.target_card for card in cards)
        if true_cards:
            return False
        return random.random() < 0.6

    def save_game_log(self, payout):
        now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        data = {
            "user_name": [self.username],
            "Time": [now],
            "Game": ["騙子酒吧"],
            "payout_ratio": [0.8],
            "Chips": [self.bet],
            "WinOrLose": [self.player_wins],
            "Outcome": [payout if self.player_wins >= 1 else int(-0.2 * self.bet)]
        }
        df_new = pd.DataFrame(data)

        try:
            log_path = "game_log.xlsx"
            if os.path.exists(log_path):
                df_existing = pd.read_excel(log_path)
                df = pd.concat([df_existing, df_new], ignore_index=True)
            else:
                df = df_new

            df.to_excel(log_path, index=False)
        except Exception as e:
            messagebox.showerror("寫入錯誤", f"無法寫入 game_log.xlsx\n{e}")




    def resolve_catch(self, do_catch, computer_catcher=False):
        self.catch_frame.pack_forget()
        self.play_button.pack_forget()

        if not self.last_played:
            return

        idx, cards = self.last_played
        truth = all(card == self.target_card for card in cards)

        self.display_played_cards(cards, self.players[idx].name)

        if do_catch:
            if truth:
                # 誤抓，失敗，對手沒說謊
                loser = self.players[self.turn].name if computer_catcher else "你"
                messagebox.showinfo("失敗", f"{loser}誤抓 {self.players[idx].name}，{loser}輸了這局！")
                # 玩家抓錯不加勝場
            else:
                # 抓對，成功
                loser = self.players[idx].name
                catcher = self.players[self.turn].name if computer_catcher else "你"
                messagebox.showinfo("成功", f"{catcher}抓對了！{loser} 說謊，{catcher}贏了這局！")
                if not computer_catcher:
                    self.player_wins += 1  # 玩家抓對加勝場
        else:
            # 沒抓，繼續輪下一位
            self.turn = (self.turn + 1) % 4
            self.root.after(1000, self.next_turn)
            return

        # 檢查是否有人出完手牌，並處理本局結束
        for player in self.players:
            if player.has_no_cards():
                if player.name == "你":
                    self.player_wins += 1
                    messagebox.showinfo("遊戲結果", f"你贏了第 {self.round} 局！")
                else:
                    messagebox.showinfo("遊戲結果", f"{player.name} 贏了第 {self.round} 局！")
                break

        self.round += 1
        if self.round > self.total_rounds:
            if self.player_wins == 0:
                # 贏 0 場，輸掉全部下注（已先扣掉賭注，無需再扣）
                payout = -self.bet
            elif self.player_wins == 1:
                # 贏 1 場，實際損益為輸 20% 賭注（扣掉下注後還輸 20%）
                payout = -0.2 * self.bet
                self.chips += self.bet  # 先扣掉賭注後，返還本金，再扣 20%
            else:
                # 贏 2 場以上，獎金為勝場 * 賭注 * 0.8
                payout = int(self.player_wins * self.bet * 0.8)
                self.chips += payout

            self.update_user_chips()
            self.save_game_log(payout)
            messagebox.showinfo("最終結果", f"四局結束！你贏了 {self.player_wins} 局，獲得 {payout} 籌碼獎勵！")
            self.player_wins = 0
            self.round = 1
            self.start_screen()
        else:
            self.root.after(1000, self.setup_round)


    def go_back(self, event=None):
        root.destroy()
        os.execl(sys.executable, sys.executable, "main.py", "--back", username)




if __name__ == "__main__":
    root = tk.Tk()             # 建立主視窗（tkinter 的 GUI 視窗）

    # 檢查是否有傳入 username 參數
    if len(sys.argv) > 1:
        username = sys.argv[1]
    else:
        username = "Guest"

    game = Game(root, username) # 傳入名字
    root.mainloop()                      # 啟動 tkinter 的事件主迴圈