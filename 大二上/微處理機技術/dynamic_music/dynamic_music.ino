#include "SPI.h"
#include "Adafruit_GFX.h"
#include "Adafruit_ILI9341.h"

#define TFT_CLK 13 // CLK pin
#define TFT_MISO 12 // MISO pin 
#define TFT_MOSI 11 // MOSI pin
#define TFT_DC 10 // DC pin
#define TFT_CS 8 // CS pin
#define TFT_RST 9 // PST pin
//建立LCD class
Adafruit_ILI9341 tft = Adafruit_ILI9341(TFT_CS, TFT_DC, TFT_MOSI, TFT_CLK, TFT_RST, TFT_MISO);

const int speakerPin = 3; //設定speakerPin為3(PWM)

unsigned int frequencies[] = {0, 262, 294, 330, 349, 392, 440, 494}; //音符對應的頻率
int melody[] = { //小蜜蜂樂譜(0為停頓)
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
const byte scoreLen = 68; //小蜜蜂樂譜長度

int cir_position[scoreLen]; //音符出現的位置
bool appear[scoreLen]; //檢查音符是否要出現的布林值
const int tft_width = 320; //LCD螢幕長度

void setup() {
  Serial.begin(9600);
  tft.begin();

  tft.fillScreen(ILI9341_BLACK); //螢幕變黑

  cli(); // clear interrupt
  TCCR1A = 0; // reset entire TCCR1A register
  TCCR1B = 0; // reset entire TCCR1B register
  TCCR1B |= B00000100; // set CS12 to 1 so we get Prescaler = 256
  TCNT1 = 0; // reset Timer1 value to 0
  TIMSK1 = B00000010; // set OCIE1A to 1 so we enable compare match A
  OCR1A = 31250; // 50000 個週期, 代表 800 ms (Prescalar = 256)
  sei();

  int now = 15; //音符初始位置
  for(int i=0 ; i<scoreLen ; i++)
  {
    cir_position[i] = now;
    now += 40; //音符的間隔
    if(melody[i] == 0) appear[i] = false; //當為frequencies = 0，不顯示音符(設appear為false)
    else appear[i] = true; //其他要顯示(設appear為true)
  }
}

void loop(void) {
  
}

ISR(TIMER1_COMPA_vect)
{
  TCNT1 = 0; // 重製計時器
  for(int i = 15; i <= tft_width; i += 40) //重製音符
  {
    tft.drawCircle(120, i, 15, ILI9341_BLACK);
  }
  
  for(int i=0 ; i<scoreLen ; i++)
  {
    if(cir_position[i] != 0 && cir_position[i] <= tft_width) //顯示音符在LCD範圍(0 ~ 320)
    {
      if(appear[i]) //如果有音符(frequencies = 0)
      {
        tft.drawCircle(120, cir_position[i], 15, ILI9341_WHITE); //畫出音符
      }
      if(cir_position[i] == 15) //當出現在要彈奏的位置
      {
        tone(speakerPin, frequencies[melody[i]], 125); //彈奏音符
      }
    }
    if(cir_position[i] > 15) //遞減每個為彈奏過的音符
    {
      cir_position[i] -= 40;
    }
    else cir_position[i] = 0;
  }
}
