#include "SPI.h"
#include "Adafruit_GFX.h"
#include "Adafruit_ILI9341.h"

#define TFT_CLK 13 // CLK pin
#define TFT_MISO 12 // MISO pin 
#define TFT_MOSI 11 // MOSI pin
#define TFT_DC 10 // DC pin
#define TFT_CS 8 // CS pin
#define TFT_RST 9 // PST pin
Adafruit_ILI9341 tft = Adafruit_ILI9341(TFT_CS, TFT_DC, TFT_MOSI, TFT_CLK, TFT_RST, TFT_MISO); //建立LCD class

const int left_button_pin = 2; //左按鈕pin角
const int right_button_pin = 3; //右按鈕pin角
const int tft_width = 320; //LCD螢幕寬度
const int tft_length = 240; //LCD螢幕長度

int red_or_blue; // 判斷產生紅色還是藍色圓圈
int x, y; // 圓圈的座標
int red_time = 0, red_score = 0; //紅圈出現的次數和打擊的次數
int blue_time = 0, blue_score = 0; // 藍圈出現的次數和打擊的次數

void setup() {
  Serial.begin(9600);
  tft.begin();
  
  pinMode(left_button_pin, INPUT_PULLUP); //設定左按鍵
  pinMode(right_button_pin, INPUT_PULLUP); //設定右按鍵
  attachInterrupt(digitalPinToInterrupt(left_button_pin), strike_red, FALLING); //硬體中斷，當左按鍵被按下，呼叫strike_red函式
  attachInterrupt(digitalPinToInterrupt(right_button_pin), strike_blue, FALLING); //硬體中斷，當右按鍵被按下，呼叫strike_blue函式
  tft.fillScreen(ILI9341_BLACK); //螢幕變黑

  // timer1 interrupt
  cli();  // clear interrupt
  TCCR1A = 0;  // reset entire TCCR1A register
  TCCR1B = 0;  // reset entire TCCR1B register
  TCCR1B |= B00000100;  // set CS12 to 1 so we get Prescaler = 256
  TCNT1 = 0;  // reset Timer1 value to 0
  TIMSK1 = B00000010;  // set OCIE1A to 1 so we enable compare match A
  OCR1A = 50000;  // 50000 個週期, 代表 800 ms (Prescalar = 256)
  sei();  // set interrupt

  //設定LCD版上的文字位置和字
  tft.setCursor(0,15); 
  tft.println(String("Red appear: ") + red_time);
  tft.setCursor(0,30);
  tft.print(String("Red Score: ") + red_score);

  tft.setCursor(120,15); 
  tft.println(String("Blue appear: ") + blue_time);
  tft.setCursor(120,30);
  tft.print(String("Blue Score: ") + blue_score);
}

void loop(void) {

}

ISR(TIMER1_COMPA_vect) //timer1
{
    tft.fillCircle(x, y, 10, ILI9341_BLACK); //將原本位置的紅圈或藍圈消除
    red_or_blue = random(2); //隨機產生0或1，0為紅，1為藍
    
    x = random(tft_length); //紅圈或藍圈的x座標(隨機)
    y = random(60, tft_width); //紅圈或藍圈的y座標(隨機)
    
    if(red_or_blue == 0) //當red_or_blue為0
    {
      tft.fillCircle(x, y, 10, ILI9341_RED); //產生紅色圓圈
      red_time += 1; //紅色出現次數+1
      change_red(); //呼叫此函式改變LCD版上顯示紅色圓圈出現次數
    }
    else if(red_or_blue == 1) //當red_or_blue為1
    {
      tft.fillCircle(x, y, 10, ILI9341_BLUE); //產生藍色圓圈
      blue_time += 1; //藍色出現次數+1
      change_blue(); //呼叫此函式改變LCD版上顯示藍色圓圈出現次數
    }
}

void change_red() //藍色出現的數目
{
  tft.fillRect(0,15, 120, 15, ILI9341_BLACK); // 清除原本藍色數目
  tft.setCursor(0,15); //文字位置
  tft.println(String("Red appear: ") + red_time); //顯示更新藍色數目
}

void change_blue() //紅色出現的數目
{
  tft.fillRect(120,15, 120, 15, ILI9341_BLACK); // 顯示原本紅色數目
  tft.setCursor(120,15); //文字位置
  tft.println(String("Blue appear: ") + blue_time); // 顯示更新紅色數目
  
}

void strike_red() //當左按鈕被按下呼叫
{
  if(red_or_blue == 0) //如果是紅色(正確)
  {
    red_score += 1; //紅色分數+1
    red_or_blue = -1; //將red_or_blue設成-1，防止計算多於分數
    tft.fillRect(0,30, 120, 15, ILI9341_BLACK); // 清除原本分數
    tft.setCursor(0,30); //文字位置
    tft.println(String("Red score: ") + red_score); //顯示紅色分數
    return ;
  }
}

void strike_blue() //當右按鈕被按下呼叫
{
  if(red_or_blue == 1) //如果是藍色(正確)
  {
    blue_score += 1; //藍色分數+1
    red_or_blue = -1; //將red_or_blue設成-1，防止計算多於分數
    tft.fillRect(120,30, 120, 15, ILI9341_BLACK); // 清除原本分數
    tft.setCursor(120,30); //文字位置
    tft.println(String("blue score: ") + blue_score); //顯示藍色分數
    return ;
  }
}
