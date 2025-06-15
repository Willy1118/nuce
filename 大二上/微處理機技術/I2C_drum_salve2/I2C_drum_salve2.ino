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
const int right_button_pin = 2; //右按鍵pin腳
const int left_button_pin = 3; //左按鍵pin腳

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
int cir_position_bee[scoreLen_bee]; //小蜜蜂音符出現的位置
bool appear_bee[scoreLen_bee]; //檢查小蜜蜂音符是否要出現的布林值
int drum_color_bee[scoreLen_bee]; //小蜜蜂音符顏色

int melody_star[] = { //小星星樂譜
  0,0,0,0,
  1,1,5,5,6,6,5,0,
  4,4,3,3,2,2,1,0,
  5,5,4,4,3,3,2,0,
  5,5,4,4,3,3,2,0,
  1,1,5,5,6,6,5,0,
  4,4,3,3,2,2,1,0
};
const byte scoreLen_star = 52; //小星星樂譜長度
int cir_position_star[scoreLen_star]; //小星星音符出現的位置
bool appear_star[scoreLen_star]; //檢查小星星音符是否要出現的布林值
int drum_color_star[scoreLen_star]; //小星星音符顏色

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
const byte scoreLen_train = 51; //火車快飛樂譜長度
int cir_position_train[scoreLen_train]; //火車快飛音符出現的位置
bool appear_train[scoreLen_train]; //檢查火車快飛音符是否要出現的布林值
int drum_color_train[scoreLen_train]; //火車快飛音符顏色

const int tft_width = 320; //LCD螢幕長度
char now_song = 1; //目前的曲目
int song_len = 0; //目前歌曲長度
int now_color; //目前音符顏色
int score = 0; //分數
int combo = 0; //連擊數
int pre_combo; //前個連擊數(用以清除原本combo數)
int strike = 0; //是否有打擊正確(0錯誤，1正確)
int is_there_note; //是否出現音符(0沒有，1有)
int count = 0; //計算目前播放到哪裡,用來判斷歌曲是否播完

void setup() {
  Serial.begin(9600);
  Wire.begin(9); //slave2地址為9
  Wire.onReceive(receiveEvent); //當接受到某種東西時，執行receiveEvent
  Wire.onRequest(requestEvent); //當被要求某種東西時，執行requestEvent

  tft.begin();

  pinMode(left_button_pin, INPUT_PULLUP); //設定左按鍵
  pinMode(right_button_pin, INPUT_PULLUP); //設定右按鍵
  attachInterrupt(digitalPinToInterrupt(left_button_pin), press_left, FALLING); //硬體中斷，當左按鍵被按下，呼叫press_left函式
  attachInterrupt(digitalPinToInterrupt(right_button_pin), press_right, FALLING); //硬體中斷，當右按鍵被按下，呼叫press_rihgt函式
  
  tft.setRotation(3); //逆時針翻轉270度
  tft.setTextSize(3); //設定自大小為3
  tft.fillScreen(ILI9341_BLACK); //螢幕變黑

  cli(); // clear interrupt
  TCCR1A = 0; // reset entire TCCR1A register
  TCCR1B = 0; // reset entire TCCR1B register
  TCCR1B |= B00000100; // set CS12 to 1 so we get Prescaler = 256
  TCNT1 = 0; // reset Timer1 value to 0
  TIMSK1 = B00000010; // set OCIE1A to 1 so we enable compare match A
  OCR1A = 31250; // 50000 個週期, 代表 800 ms (Prescalar = 256)
  sei();
}

void loop(void) { 
}

ISR(TIMER1_COMPA_vect) //硬體中斷
{
  TCNT1 = 0; // 重製計時器
  if(now_song == '1' || now_song == '2' || now_song == '3') count ++; //計算目前播放到哪裡

  for(int i = 15; i <= tft_width; i += 40) //重製音符
  {
    tft.drawCircle(i, 120, 15, ILI9341_BLACK);
  }
  
  for(int i=0 ; i<song_len ; i++)
  {
    if(now_song == '1') //小蜜蜂
    {
        if(cir_position_bee[i] != 0 && cir_position_bee[i] <= tft_width) //顯示音符在LCD範圍(0 ~ 320)
        {
          if(cir_position_bee[i] == 15) //當出現在要彈奏的位置
          {
            tone(speakerPin, frequencies[melody_bee[i]], 125); //彈奏音符 
            now_color = drum_color_bee[i]; //同步該音符顏色
            if(appear_bee[i]) is_there_note = 1; //判斷是否有音符(用以計算分數和combo)
            else is_there_note = 0;
            count_combo(); //計算combo
          }
          if(appear_bee[i]) //如果有音符(frequencies = 0)
          {
            if(drum_color_bee[i] == 0) tft.drawCircle(cir_position_bee[i], 120, 15, ILI9341_BLUE); //當為藍色(0)時，畫出藍音符
            else if(drum_color_bee[i] == 1) tft.drawCircle(cir_position_bee[i], 120, 15, ILI9341_RED); //當為紅色(1)時，畫出紅音符
          }
          
        }
        if(cir_position_bee[i] > 15) //遞減每個為彈奏過的音符
        {
          cir_position_bee[i] -= 40;
        }
        else cir_position_bee[i] = 0;
    }
    if(now_song == '2')
    {
        if(cir_position_star[i] != 0 && cir_position_star[i] <= tft_width) //顯示音符在LCD範圍(0 ~ 320)
        {
          if(cir_position_star[i] == 15) //當出現在要彈奏的位置
          {
            tone(speakerPin, frequencies[melody_star[i]], 125); //彈奏音符
            now_color = drum_color_star[i]; //同步該音符顏色
            if(appear_star[i]) is_there_note = 1; //判斷是否有音符(用以計算分數和combo)
            else is_there_note = 0;
            count_combo(); //計算combo
          }
          if(appear_star[i]) //如果有音符(frequencies = 0)
          {
            if(drum_color_star[i] == 0) tft.drawCircle(cir_position_star[i], 120, 15, ILI9341_BLUE); //當為藍色(0)時，畫出藍音符
            else if(drum_color_star[i] == 1) tft.drawCircle(cir_position_star[i], 120, 15, ILI9341_RED); //當為紅色(1)時，畫出紅音符
          }
        }
        if(cir_position_star[i] > 15) //遞減每個為彈奏過的音符
        {
          cir_position_star[i] -= 40;
        }
        else cir_position_star[i] = 0;
    }
    if(now_song == '3') //火車快飛
    {
        if(cir_position_train[i] != 0 && cir_position_train[i] <= tft_width) //顯示音符在LCD範圍(0 ~ 320)
        {
          if(cir_position_train[i] == 15) //當出現在要彈奏的位置
          {
            tone(speakerPin, frequencies[melody_train[i]], 125); //彈奏音符
            now_color = drum_color_train[i]; //同步該音符顏色if(appear_star[i]) is_there_note = 1;
            if(appear_train[i]) is_there_note = 1; //判斷是否有音符(用以計算分數和combo)
            else is_there_note = 0;
            count_combo(); //計算combo
          }
          if(appear_train[i]) //如果有音符(frequencies = 0)
          {
            if(drum_color_train[i] == 0) tft.drawCircle(cir_position_train[i], 120, 15, ILI9341_BLUE); //當為藍色(0)時，畫出藍音符
            else if(drum_color_train[i] == 1) tft.drawCircle(cir_position_train[i], 120, 15, ILI9341_RED); //當為紅色(1)時，畫出紅音符
            is_there_note = 1;
          }
          else is_there_note = 0;
        }
        if(cir_position_train[i] > 15) //遞減每個為彈奏過的音符
        {
          cir_position_train[i] -= 40;
        }
        else cir_position_train[i] = 0;
    }
  }
}

void receiveEvent(int bytes) //接受到master傳來的訊息時執行
{
  reset(); //因為可以重玩，所以每次近來都要重置
  tft.setTextSize(2); //設定文字大小
  tft.setCursor(10,140); //設定文字位置
  tft.setTextColor(ILI9341_WHITE); //設定文字顏色
  tft.print("Score 0"); //印出初始分數

  tft.setTextSize(3); //設定文字大小
  now_song = Wire.read(); //讀取master傳來的訊息
  if(now_song == '1') //當收到 '1' 時，代表為小蜜蜂
  {
    tft.setCursor(70, 15);
    tft.println("Little bee");
  }
  else if(now_song == '2') //當收到 '2' 時，代表為小星星
  {
    tft.setCursor(61, 15);
    tft.println("Little star");
  }
  else if(now_song == '3') //當收到 '3' 時，代表為火車快飛
  {
    tft.setCursor(115, 15);
    tft.println("Train");
  }
  set_drum(); //設定音符顏色
  
  //繪製箭頭
  tft.drawLine(15, 70, 15, 85, ILI9341_WHITE);
  tft.fillTriangle(12, 85, 18, 85, 15, 90, ILI9341_WHITE);
}

void requestEvent()
{
  //當歌曲播放完畢時
  if( (count==scoreLen_bee+2 && now_song == '1') || (count==scoreLen_star+2 && now_song == '2') || (count==scoreLen_train+2 && now_song == '3'))
  {
    Wire.write(70); //寫70給master(因為每首歌曲長度不超過70，所以分數<=70，當master收到70代表結束)
    Wire.write(combo); //寫combo數給master
    tft.setTextSize(2);
    String text = "Song Complete"; 
    int text_length = text.length() * 6 * 2; // "Song Complete"長度
    int x = (tft_width - text_length) / 2; //文字置中
    tft.setCursor(x,220);
    tft.setTextColor(ILI9341_WHITE);
    tft.print("Song Complete");
  }
  else //當歌曲還未播放完畢時，同步score和combo給master
  {
    Wire.write(score);
    Wire.write(combo);
  }
}

void press_right() //硬體中斷，當按下左鍵執行
{
  if(now_color == 1 && is_there_note == 1) //顏色為紅色時(正確)
  {
    show_score(); //更新分數
    now_color = -1; //當+1分後，馬上讓目前顏色變-1，以免分數重複計算
    strike = 1; //打擊正確時strike為1
  }
}

void press_left() //硬體中斷，當按下右鍵執行
{
  if(now_color == 0 && is_there_note == 1) //顏色為藍色時(正確)
  {
    show_score(); //更新分數
    now_color = -1; //當+1分後，馬上讓目前顏色變-1，以免分數重複計算
    strike = 1; //打擊正確時strike為1
  }
}

void set_drum() //設定音符位置及顏色
{
  //設定歌曲長度
  if(now_song == '1') song_len = scoreLen_bee;
  else if(now_song == '2') song_len = scoreLen_star; 
  else if(now_song == '3') song_len = scoreLen_train; 

  int now = 15; //音符初始位置
  for(int i=0 ; i<song_len ; i++)
  {
    int drum_color = random(0, 6); //取亂數，奇數為紅色，偶數為藍色
    now += 40; //音符的間隔
    if(now_song == '1') //小蜜蜂
    {
      cir_position_bee[i] = now; //音符位置設定
      if(melody_bee[i] == 0) appear_bee[i] = false; //當為frequencies = 0，不顯示音符(設appear為false)
      else appear_bee[i] = true; //其他要顯示(設appear為true)
      if(drum_color % 2 == 0) drum_color_bee[i] = 0; //當drum_color為偶數時,音符為藍色
      else drum_color_bee[i] = 1; //當drum_color為奇數時,音符為紅色
    }
    else if(now_song == '2') //小星星
    {
      cir_position_star[i] = now;
      if(melody_star[i] == 0) appear_star[i] = false; //當為frequencies = 0，不顯示音符(設appear為false)
      else appear_star[i] = true; //其他要顯示(設appear為true)
      if(drum_color % 2 == 0) drum_color_star[i] = 0; //當drum_color為偶數時,音符為藍色
      else drum_color_star[i] = 1; //當drum_color為奇數時,音符為紅色
    }
    else if(now_song == '3') //火車快飛
    {
      cir_position_train[i] = now;   
      if(melody_train[i] == 0) appear_train[i] = false; //當為frequencies = 0，不顯示音符(設appear為false)
      else appear_train[i] = true; //其他要顯示(設appear為true)
      if(drum_color % 2 == 0) drum_color_train[i] = 0; //當drum_color為偶數時,音符為藍色
      else drum_color_train[i] = 1; //當drum_color為奇數時,音符為紅色
    }
  }
}

void show_score() //顯示分數
{
  //清除原本分數
  tft.setTextSize(2);
  tft.setCursor(10,140);
  tft.setTextColor(ILI9341_BLACK);
  tft.print("Score ");
  tft.print(score);

  score++; //加分

  //顯示新的分數
  tft.setTextSize(2);
  tft.setCursor(10,140);
  tft.setTextColor(ILI9341_WHITE);
  tft.print("Score ");
  tft.print(score);
}

void count_combo() //計算combo數
{
  if(is_there_note == 1) //如果有音符
  {
    if(strike == 1 && is_there_note == 1) //有打到
    {
      pre_combo = combo;
      combo += 1;
    }
    else if(strike == 0 && is_there_note == 1) //沒打到
    {
      pre_combo = combo;
      combo = 0;
    }
    else combo = combo;
    strike = 0; //重置strike
    print_combo(combo); //印出combo數
  }
}

void print_combo(int combo) //印出combo數
{
  //清除原本combo
  tft.setTextSize(2);
  tft.setCursor(10,180);
  tft.setTextColor(ILI9341_BLACK);
  tft.print("Combo ");
  tft.print(pre_combo);

  //顯示新的combo
  tft.setTextSize(2);
  tft.setCursor(10,180);
  tft.setTextColor(ILI9341_WHITE);
  tft.print("Combo ");
  tft.print(combo);
}

void reset() //重置
{
  tft.fillScreen(ILI9341_BLACK); //螢幕變黑
  score = 0; //分數歸0
  combo = 0; //combo歸0
  strike = 0; //打擊歸0
  count = 0; //記數歸0
  now_song = '0'; //回到沒選歌狀態
}