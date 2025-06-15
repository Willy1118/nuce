#include "SPI.h"
#include "Adafruit_GFX.h"
#include "Adafruit_ILI9341.h"
#include <Wire.h>

#define TFT_CLK 13 // CLK pin
#define TFT_MISO 12 // MISO pin 
#define TFT_MOSI 11 // MOSI pin
#define TFT_DC 10 // DC pin
#define TFT_CS 8 // CS pin
#define TFT_RST 9 // PST pin
//建立LCD class
Adafruit_ILI9341 tft = Adafruit_ILI9341(TFT_CS, TFT_DC, TFT_MOSI, TFT_CLK, TFT_RST, TFT_MISO);

const int speakerPin = 4; //設定speakerPin為3(PWM)
const int right_button_pin = 2; //設定右按鍵pin腳(用以選歌)
const int left_button_pin = 3; //設定左按鍵pin腳(用以確認歌曲)
const int slave1_address = 8; //設定slave1 addrewss
const int slave2_address = 9; //設定slave2 addrewss

unsigned long lastDebounceTime = 0; //防彈跳(儲存上個時間)
unsigned long debounceDelay = 100; // 防彈跳時間

unsigned int frequencies[] = {0, 262, 294, 330, 349, 392, 440, 494}; //音符對應的頻率
int melody_bee[] = { //小蜜蜂樂譜(0為停頓)
  0,0,0,0,
  5,3,3,0,4,2,2,0,
  1,2,3,4,5,5,5,0,
  5,3,3,0,4,2,2,0,
  1,3,5,5,3,0,0,0,
  2,2,2,2,2,3,4,0,
  3,3,3,3,3,4,5,0,
  5,3,3,0,4,2,2,0,
  1,3,5,5,1,0,0,0
};
const byte scoreLen_bee = 68; //小蜜蜂樂譜長度

int melody_star[] = { //小星星樂譜(0為停頓)
  0,0,0,0,
  1,1,5,5,6,6,5,0,
  4,4,3,3,2,2,1,0,
  5,5,4,4,3,3,2,0,
  5,5,4,4,3,3,2,0,
  1,1,5,5,6,6,5,0,
  4,4,3,3,2,2,1,0
};
const byte scoreLen_star = 52; //小星星樂譜長度

int melody_train[] = { //火車快飛樂譜
  0,0,0,0,
  5,5,3,1,
  5,5,3,1,
  2,3,4,4,
  3,4,5,5,
  5,3,5,3,
  2,3,1,0,
  4,2,2,2,
  3,1,1,1,
  4,2,2,2,
  3,1,1,1,
  2,4,3,2,
  1,2,1
};
const byte scoreLen_train = 51; //

const int tft_width = 320; //LCD螢幕長度
int is_song_select = 0; //是否選歌(0還沒選，1選了)
int play_song = 0; //目前播放的歌播到第幾個音
int can_request_1 = 1, can_request_2 = 1; //是否可接受slave的訊號(0不行 1可以)
int now_song = 1; //目前選歌曲目(共3首)
int can_send = 0; //是否可傳送信號給slave(0不行 1可以)
int pre_combo_1, pre_combo_2; //前個連擊數(用以清除原本combo數)
int score1, score2; //分數(用以決定勝負)

void setup() {
  Wire.begin(); //master
  Serial.begin(9600);

  tft.begin();

  pinMode(left_button_pin, INPUT_PULLUP); //設定左按鍵
  pinMode(right_button_pin, INPUT_PULLUP); //設定右按鍵
  attachInterrupt(digitalPinToInterrupt(left_button_pin), press_left, FALLING); //硬體中斷，當左按鍵被按下，呼叫press_left函式
  attachInterrupt(digitalPinToInterrupt(right_button_pin), press_right, FALLING); //硬體中斷，當右按鍵被按下，呼叫press_right函式
  
  tft.setRotation(3); //旋轉螢幕(逆轉270度)
  tft.fillScreen(ILI9341_BLACK); //螢幕變黑
  show_song(); //顯示歌曲
  tft.fillCircle(10, 30, 3, ILI9341_WHITE); //初始選歌為第一首

  cli(); // clear interrupt
  TCCR1A = 0; // reset entire TCCR1A register
  TCCR1B = 0; // reset entire TCCR1B register
  TCCR1B |= B00000100; // set CS12 to 1 so we get Prescaler = 256
  TCNT1 = 0; // reset Timer1 value to 0
  TIMSK1 = B00000010; // set OCIE1A to 1 so we enable compare match A
  OCR1A = 31250; // 50000 個週期, 代表 800 ms (Prescalar = 256)
  sei();

  lastDebounceTime = millis();
}

void loop(void) {
  if(is_song_select == 1 && can_send == 1) //當選歌了，且master可以傳送給slave1
  {
    Wire.beginTransmission(slave1_address);
    if(now_song == 1) Wire.write('1');
    if(now_song == 2) Wire.write('2');
    if(now_song == 3) Wire.write('3');
    Wire.endTransmission();
  }

  if(is_song_select == 1 && can_send == 1) //當選歌了，且master可以傳送給slave2
  {
    Wire.beginTransmission(slave2_address);
    if(now_song == 1) Wire.write('1');
    if(now_song == 2) Wire.write('2');
    if(now_song == 3) Wire.write('3');
    Wire.endTransmission();
    can_send = 0; //停止傳送
  }

  if(is_song_select == 1 && can_request_1 == 1) //當選歌了，且可以接受slave1傳來的訊息
  {
    Wire.requestFrom(slave1_address, 2); //跟slave1要數據
    while(Wire.available())
    {
      int score = Wire.read(); //讀取分數
      int combo = Wire.read(); //讀取combo
      int pre_score; //儲存上個分數
      if(score == 70) //當分數70時，代表遊戲結束
      {
        String text = "Song Complete"; 
        int text_length = text.length() * 6 * 2; // "Song Complete"長度
        int x = (tft_width - text_length) / 2; //文字置中
        can_request_1 = 0; //停止要求slave1
        tft.setTextSize(2);
        tft.setCursor(x,220);
        tft.setTextColor(ILI9341_WHITE);
        tft.print("Song Complete");
      }
      else if(score != pre_score) //當分數有變化時
      {
        show_p1_score(score-1); //印出分數
        pre_score = score; //儲存分數
        score1 = score; //儲存分數
      }
      if(pre_combo_1 != combo) //當combo有變化時
        show_p1_combo(combo); //印出combo
    }
  }
  if(is_song_select == 1 && can_request_2 == 1) //當選歌了，且可以接受slave2傳來的訊息
  {
    Wire.requestFrom(slave2_address, 2); //跟slave2要數據
    while(Wire.available())
    {
      int score = Wire.read(); //讀取分數
      int combo = Wire.read(); //讀取combo
      int pre_score; //儲存上個分數
      if(score == 70) //當分數70時，代表遊戲結束
      {
        String text = "Song Complete"; 
        int text_length = text.length() * 6 * 2; // "Song Complete"長度
        int x = (tft_width - text_length) / 2; //文字置中
        can_request_2 = 0; //停止要求slave2
        tft.setTextSize(2);
        tft.setCursor(x,220);
        tft.setTextColor(ILI9341_WHITE);
        tft.print("Song Complete");
      }
      else if(score != pre_score) //當分數有變化時
      {
        show_p2_score(score-1); //印出分數
        pre_score = score; //儲存分數
        score2 = score; //儲存分數
      }
      if(pre_combo_2 != combo) //當combo有變化時
        show_p2_combo(combo); //印出combo
    }
  }
  if(can_request_1 == 0 && can_request_2 == 0) pk(); //當兩個都停止要求時(代表遊戲結束)，決定勝負
}

ISR(TIMER1_COMPA_vect)
{
  TCNT1 = 0; // 重製計時器
  if(now_song == 1 && is_song_select == 0) //當目前是第一首歌且還沒選歌時
  { //播小蜜蜂
    tone(speakerPin, frequencies[melody_bee[play_song++]], 125); //彈奏音符
    if(play_song == scoreLen_bee) play_song = 0; //當播完小蜜蜂時，重新播放(重製play_song)
  }
  else if(now_song == 2 && is_song_select == 0) //當目前是第二首歌且還沒選歌時
  { //播小星星
    tone(speakerPin, frequencies[melody_star[play_song++]], 125); //彈奏音符
    if(play_song == scoreLen_star) play_song = 0; //當播完小星星時，重新播放(重製play_song)
  }
  else if(now_song == 3 && is_song_select == 0) //當目前是第三首歌且還沒選歌時
  { //播火車快飛
    tone(speakerPin, frequencies[melody_train[play_song++]], 125); //彈奏音符
    if(play_song == scoreLen_train) play_song = 0; //當播完火車快飛時，重新播放(重製play_song)
  }
}

void show_song() //顯示歌曲
{
  tft.setCursor(30, 10);
  tft.setTextColor(ILI9341_WHITE);  
  tft.setTextSize(3);
  tft.println("little bee");
  tft.setCursor(30, 90);
  tft.println("little star");
  tft.setCursor(30, 170);
  tft.println("train");
}

void press_right() //右按鈕硬體中斷，選歌
{
  unsigned long currentTime = millis(); //目前時間

  // 防彈跳 和 顯示目前是在第幾首(顯示白點在歌曲前)
  if (currentTime - lastDebounceTime > debounceDelay) 
  {
    if(digitalRead(right_button_pin) == LOW) // 檢查按鈕是否仍然處於按下狀態
    {  
      tft.fillCircle(10, 30 + 80 * (now_song - 1), 3, ILI9341_BLACK); //清除原本的歌
      now_song += 1; //歌曲目+1
      if (now_song == 4) now_song = 1; //因為沒有第四首，所以當now_song為4時，讓他變成第1首
      tft.fillCircle(10, 30 + 80 * (now_song - 1), 3, ILI9341_WHITE); //顯示目前的歌

      lastDebounceTime = millis();  // 儲存按下按鈕的時間
    }
  }
  play_song = 0; //重新播放新的音樂
}

void press_left() //左按鈕硬體中斷，確定歌
{
  unsigned long currentTime = millis(); //目前時間

  // 防彈跳
  if (currentTime - lastDebounceTime > debounceDelay) 
  {
    if(digitalRead(left_button_pin) == LOW) // 檢查按鈕是否仍然處於按下狀態
    {
      is_song_select = 1;
      tft.fillScreen(ILI9341_BLACK); //螢幕變黑
      if(now_song == 1) //選第一首
      {
        String text = "Little bee"; 
        int text_length = text.length() * 6 * 3; // "Little bee"長度
        int x = (tft_width - text_length) / 2; //文字置中

        tft.setCursor(x, 0);
        tft.setTextColor(ILI9341_WHITE);  
        tft.setTextSize(3);
        tft.println("little bee");
      }
      else if(now_song == 2) //選第二首
      {
        String text = "Little star";
        int text_length = text.length() * 6 * 3; // "Little star"長度
        int x = (tft_width - text_length) / 2; //文字置中

        tft.setCursor(x, 0);
        tft.setTextColor(ILI9341_WHITE);  
        tft.setTextSize(3);
        tft.println("little star");
      }
      else if(now_song == 3) //選第三首
      {
        String text = "Train";
        int text_length = text.length() * 6 * 3; // "Train"長度
        int x = (tft_width - text_length) / 2; //文字置中

        tft.setCursor(x, 0);
        tft.setTextColor(ILI9341_WHITE);  
        tft.setTextSize(3);
        tft.println("Train");
      }
      can_send = 1; //讓master可以傳給slave
      lastDebounceTime = millis();  // 儲存按下按鈕的時間
    } 
  }   
  show_player(); //顯示玩家
  show_p1_score(-1); //顯示player 1初始分數
  show_p2_score(-1); //顯示player 2初始分數
  pre_combo_1 = 0; //設定player 1初始combo
  pre_combo_2 = 0; //設定player 2初始combo
  show_p1_combo(0); //顯示player 1初始combo
  show_p2_combo(0); //顯示player 2初始combo
}

void show_player() //顯示玩家
{
  tft.setTextSize(3);
  tft.setCursor(60, 80);
  tft.setTextColor(ILI9341_BLUE);
  tft.print("P2");

  tft.setTextSize(3);
  tft.setCursor(210, 80);
  tft.setTextColor(ILI9341_RED);
  tft.print("P1");
}

void show_p1_score(int score) //顯示player1分數
{
  //清除原本分數
  tft.setTextSize(2);
  tft.setCursor(190,120);
  tft.setTextColor(ILI9341_BLACK);
  tft.print("Score ");
  tft.print(score);

  score++; //加分

  //顯示新的分數
  tft.setTextSize(2);
  tft.setCursor(190,120);
  tft.setTextColor(ILI9341_RED);
  tft.print("Score ");
  tft.print(score);
}

void show_p1_combo(int combo) //顯示player1 combo
{
  //清除原本combo
  tft.setTextSize(2);
  tft.setCursor(190,170);
  tft.setTextColor(ILI9341_BLACK);
  tft.print("Combo ");
  tft.print(pre_combo_1);

  //顯示新的combo
  tft.setTextSize(2);
  tft.setCursor(190,170);
  tft.setTextColor(ILI9341_RED);
  tft.print("Combo ");
  tft.print(combo);
  pre_combo_1 = combo;
}

void show_p2_score(int score) //顯示player2分數
{
  //清除原本分數
  tft.setTextSize(2);
  tft.setCursor(40,120);
  tft.setTextColor(ILI9341_BLACK);
  tft.print("Score ");
  tft.print(score);

  score++; //加分

  //顯示新的分數
  tft.setTextSize(2);
  tft.setCursor(40,120);
  tft.setTextColor(ILI9341_BLUE);
  tft.print("Score ");
  tft.print(score);
}

void show_p2_combo(int combo) //顯示player2 combo
{
  //清除原本分數
  tft.setTextSize(2);
  tft.setCursor(40,170);
  tft.setTextColor(ILI9341_BLACK);
  tft.print("Combo ");
  tft.print(pre_combo_2);

  //顯示新的分數
  tft.setTextSize(2);
  tft.setCursor(40,170);
  tft.setTextColor(ILI9341_BLUE);
  tft.print("Combo ");
  tft.print(combo);
  pre_combo_2 = combo;
}

void pk() //決定勝負
{
  if(score1 > score2) //p1分數大於p2
  {
    String text = "Player 1 win !"; //p1贏
    int text_length = text.length() * 6 * 2; // "Little bee"長度
    int x = (tft_width - text_length) / 2; //文字置中
    tft.setCursor(x, 40);
    tft.print("Player 1 win !");
  }
  else if(score1 < score2) //p1分數小於p2
  {
    String text = "Player 2 win !"; //p2贏
    int text_length = text.length() * 6 * 2; // "Little bee"長度
    int x = (tft_width - text_length) / 2; //文字置中
    tft.setCursor(x, 40);
    tft.print("Player 2 win !");
  }
  else//p1分數等於p2
  {
    String text = "Draw !"; //平手
    int text_length = text.length() * 6 * 2; // "Little bee"長度
    int x = (tft_width - text_length) / 2; //文字置中
    tft.setCursor(x, 40);
    tft.print("Draw !");
  }
  delay(3000);
  reset(); //重置，可重玩
}

void reset() //重置
{
  tft.fillScreen(ILI9341_BLACK); //螢幕變黑
  show_song(); //顯示歌曲
  tft.fillCircle(10, 30, 3, ILI9341_WHITE); //初始選歌為第一首
  is_song_select = 0; //是否選歌(0還沒選，1選了)
  can_request_1 = 1, can_request_2 = 1;
  now_song = 1; //目前選歌曲目(共3首)
  can_send = 0; //是否可傳送信號給slave(0不行 1可以);
  play_song = 0; //重置目前播放到第幾個音
}