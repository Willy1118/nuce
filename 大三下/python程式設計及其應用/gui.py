import gesture
import iris
import sys
import cv2
import numpy as np
import webbrowser
import pygetwindow as gw
import control_mouse
from PyQt5.QtWidgets import (
    QApplication, QWidget, QLabel, QPushButton, QMessageBox,
    QHBoxLayout, QVBoxLayout, QFrame, QRadioButton, QMessageBox, QDialog,
    QStyle, QButtonGroup
)
from PyQt5.QtGui import QImage, QPixmap, QGuiApplication
from PyQt5.QtCore import QTimer, Qt
import time
from PyQt5.QtWidgets import QScrollArea
import os


class CameraWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("手勢與虹膜偵測與控制系統")
        self.setContentsMargins(0, 0, 0, 0)
        self.mouse_control_mode = False
        self.ok_gesture_start_time = 0  # 記錄 OK 手勢開始時間
        self.ok_gesture_threshold = 1.0  # 需要持續 1 秒

        w, h = 1000, 600
        self.resize(w, h)
        screen = QGuiApplication.primaryScreen().geometry()
        x = int((screen.width() - w) / 2)
        y = int((screen.height() - h) / 2)
        self.move(x, y)

        # 左區
        self.camera_frame = QFrame(self)
        self.camera_frame.setStyleSheet("background-color: black;")
        self.camera_label = QLabel(self.camera_frame)
        self.camera_label.setAlignment(Qt.AlignCenter)

        camera_layout = QVBoxLayout()
        camera_layout.addWidget(self.camera_label)
        self.camera_frame.setLayout(camera_layout)

        # 右區
        self.right_frame = QFrame(self)
        self.right_frame.setStyleSheet("background-color: lightgray;")
        
        self.info_button = QPushButton("i")
        self.info_button.setFixedSize(20, 20)
        self.info_button.setStyleSheet("""
            QPushButton {
                border-radius: 10px;
                background-color: gray;
                color: white;
                font-weight: 900;
                font-size: 12px;
            }
        """)
        self.info_button.clicked.connect(self.show_info_dialog)

        self.start_button = QPushButton("開啟鏡頭", self)
        self.start_button.clicked.connect(self.ask_open_camera)
        self.start_button.setStyleSheet("color: white; background-color: purple;")

        self.stop_button = QPushButton("關閉鏡頭", self)
        self.stop_button.clicked.connect(self.ask_close_camera)
        self.stop_button.setStyleSheet("color: white; background-color: purple;")
        
        self.mode_label = QLabel("選擇模式")
        self.mode_label.setStyleSheet("font-weight: bold; font-size: 20px;")

        self.hand_radio = QRadioButton("手部")
        self.hand_radio.setStyleSheet("font-size: 18px;")
        self.eye_radio = QRadioButton("眼部")
        self.eye_radio.setStyleSheet("font-size: 18px;")
        self.hand_radio.setChecked(True)

        radio_layout = QHBoxLayout()
        radio_layout.setContentsMargins(20, 0, 20, 0) # 左上右下
        radio_layout.addWidget(self.hand_radio)
        radio_layout.addWidget(self.eye_radio)
        
        self.web_label = QLabel("選擇欲前往的網站")
        self.web_label.setStyleSheet("font-weight: bold; font-size: 20px;")
        
        self.web_group = QButtonGroup()
        self.website = ["youtube.com", "bilibili.com"]
        self.web_btn = {}
        for site in self.website:
            btn = QPushButton(site)
            btn.setFixedSize(120, 40)
            btn.setStyleSheet("""
                QPushButton {
                    border-radius: 5px;
                    background-color: orange;
                    color: black;
                    font-weight: bold;
                    font-size: 16px;
                }
            """)
            self.web_group.addButton(btn)
            self.web_btn[site] = btn
            btn.clicked.connect(lambda checked, s=site: self.open_website(s))

        # 禁止按鈕獲得自動焦點
        self.start_button.setFocusPolicy(Qt.NoFocus)
        self.stop_button.setFocusPolicy(Qt.NoFocus)
        self.info_button.setFocusPolicy(Qt.NoFocus)
        for btn in self.web_btn.values():
            btn.setFocusPolicy(Qt.NoFocus)

        # 最後設視窗取得焦點
        self.setFocus()

        right_layout = QVBoxLayout()
        right_layout.setContentsMargins(20, 10, 20, 20) # 左上右下
        right_layout.addWidget(self.info_button, alignment=Qt.AlignRight)  # 放最上方
        right_layout.addSpacing(20)
        right_layout.addWidget(self.start_button)
        right_layout.addWidget(self.stop_button)
        right_layout.addSpacing(20)
        right_layout.addWidget(self.mode_label)
        right_layout.addSpacing(15)
        right_layout.addLayout(radio_layout)
        right_layout.addSpacing(20)
        right_layout.addWidget(self.web_label)
        right_layout.addSpacing(15)
        
        self.web_layout = QVBoxLayout()
        self.web_layout.setSpacing(10)
        self.web_layout.setContentsMargins(0, 0, 0, 0)

        for site in self.website:
            self.web_layout.addWidget(self.web_btn[site], alignment=Qt.AlignHCenter)

        # 最後把它加入到右側主 layout
        right_layout.addLayout(self.web_layout)
        right_layout.addStretch()
        self.right_frame.setLayout(right_layout)

        # 主layout
        main_layout = QHBoxLayout()
        main_layout.setSpacing(0)
        main_layout.setContentsMargins(0, 0, 0, 0)
        main_layout.addWidget(self.camera_frame, 2)
        main_layout.addWidget(self.right_frame, 1)
        self.setLayout(main_layout)

        # 初始化 camera
        self.cap = None
        self.timer = QTimer()
        self.timer.timeout.connect(self.update_frame)
        
    def show_info_dialog(self):
        dialog = InfoDialog(self)
        dialog.exec_()

    def ask_open_camera(self):
        reply = QMessageBox.question(
            self, "確認", "是否要開啟鏡頭？",
            QMessageBox.Yes | QMessageBox.No, QMessageBox.No
        )
        if reply == QMessageBox.Yes:
            self.open_camera()

    def ask_close_camera(self):
        if self.cap is None:
            QMessageBox.information(self, "提醒", "鏡頭尚未開啟。")
            return

        reply = QMessageBox.question(
            self, "確認", "是否要關閉鏡頭？",
            QMessageBox.Yes | QMessageBox.No, QMessageBox.No
        )
        if reply == QMessageBox.Yes:
            self.close_camera()

    def open_camera(self):
        if self.cap is None or not self.cap.isOpened():
            self.cap = cv2.VideoCapture(0)
            if not self.cap.isOpened():
                QMessageBox.critical(self, "錯誤", "無法開啟鏡頭")
                self.cap = None
                return
            self.timer.start(30)

    def close_camera(self):
        if self.cap:
            self.timer.stop()
            self.cap.release()
            self.cap = None
            self.camera_label.clear()  # 清空畫面

    def open_website(self, site):
        url = f"https://{site}"
        print(f"開啟網站：{url}")
        webbrowser.open(url)
        
    def is_valid_window(self):
        allowed_win = ["youtube", "bilibili", self.windowTitle().lower()]
        try:
            window = gw.getActiveWindow()
            if window is None:
                #print("🔍 無作用中的視窗")
                return False
            title = window.title.lower() # 轉小寫
            #print(f"🔍 當前視窗標題：{title}")
            return any(keyword in title for keyword in allowed_win)
        except Exception as e:
            print(f"無法取得最上層視窗：{e}")
            return False

    def update_frame(self):
        if self.cap is None:
            return

        ret, frame = self.cap.read()
        if not ret or frame is None:
            print("無法從攝影機取得影像")
            return

        processed_frame = cv2.flip(frame, 1)

        if self.is_valid_window():
            current_time = time.time()
            
            try:
                # 無論何種模式都先進行手勢偵測（僅用於 OK 手勢）
                img, gesture_detect = gesture.process_gesture_frame(frame, self.mouse_control_mode)
                
                # OK 手勢處理邏輯（優先於其他所有動作）
                if gesture_detect == "ok":
                    if self.ok_gesture_start_time == 0:
                        self.ok_gesture_start_time = current_time
                    elif current_time - self.ok_gesture_start_time >= self.ok_gesture_threshold:
                        self.mouse_control_mode = not self.mouse_control_mode
                        print(f"切換滑鼠控制模式: {self.mouse_control_mode}")
                        self.ok_gesture_start_time = 0
                else:
                    self.ok_gesture_start_time = 0

                # 根據當前模式選擇處理方式
                if self.mouse_control_mode:
                    # 滑鼠控制模式下，強制使用 control_mouse 處理
                    processed_frame = control_mouse.process_mouse_frame(frame)
                else:
                    # 非滑鼠控制模式下，根據選擇的模式處理
                    if self.hand_radio.isChecked():
                        processed_frame = img  # 手部模式：顯示手勢偵測結果
                    else:
                        processed_frame = iris.process_iris_frame(frame)  # 眼部模式：處理虹膜動作

            except Exception as e:
                print(f"影像處理錯誤：{e}")
                return

        # 顯示影像
        try:
            processed_frame = cv2.cvtColor(processed_frame, cv2.COLOR_BGR2RGB)
            h, w, ch = processed_frame.shape
            bytes_per_line = ch * w
            qt_img = QImage(processed_frame.data, w, h, bytes_per_line, QImage.Format_RGB888)
            pixmap = QPixmap.fromImage(qt_img)
            self.camera_label.setPixmap(pixmap.scaled(
                self.camera_label.width(),
                self.camera_label.height(),
                Qt.KeepAspectRatio
            ))
        except Exception as e:
            print(f"影像顯示錯誤：{e}")
            
    def closeEvent(self, event):
        self.close_camera()  # 保證關閉時釋放資源

class InfoDialog(QDialog):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("使用說明")
        self.setFixedSize(400, 500)
        self.setStyleSheet("background-color: white;")
        self.setWindowFlags(self.windowFlags() & ~Qt.WindowContextHelpButtonHint)
        
        icon = self.style().standardIcon(QStyle.SP_MessageBoxInformation)
        self.setWindowIcon(icon)

        # 文字說明
        label = QLabel(
            "鏡頭使用說明\n\n"
            "1. 點擊『開啟鏡頭』按鈕\n"
            "2. 選擇手部或眼部模式\n"
            "3. 點擊『關閉鏡頭』以關閉視訊\n"
            "註：比ok手勢可切換到食指控制滑鼠模式\n\n"
            "動作說明"
        )
        label.setWordWrap(True)

        # 圖片顯示
        image_label = QLabel()
        image_label.setAlignment(Qt.AlignCenter)
        
        img_path = self.resource_path("assets/intro.png")
        if os.path.exists(img_path):
            try:
                pixmap = QPixmap(img_path)
                if not pixmap.isNull():
                    image_label.setPixmap(pixmap.scaledToWidth(700, Qt.SmoothTransformation))
                else:
                    image_label.setText("無法載入說明圖片")
            except Exception as e:
                image_label.setText(f"圖片載入錯誤: {str(e)}")
        else:
            image_label.setText(f"圖片文件不存在: {img_path}")

        # 建立一個容器 widget 來放 label 和圖片
        content_widget = QWidget()
        layout = QVBoxLayout()
        layout.addWidget(label)
        layout.addWidget(image_label)
        content_widget.setLayout(layout)

        scroll = QScrollArea()
        scroll.setWidgetResizable(True)
        scroll.setWidget(content_widget)

        main_layout = QVBoxLayout()
        main_layout.addWidget(scroll)
        self.setLayout(main_layout)
    
    def resource_path(self, relative_path): 
        """ 獲取資源的絕對路徑"""
        try:
            base_path = sys._MEIPASS
        except Exception:
            base_path = os.path.abspath(".")
        return os.path.join(base_path, relative_path)


if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = CameraWindow()
    window.show()
    sys.exit(app.exec_())