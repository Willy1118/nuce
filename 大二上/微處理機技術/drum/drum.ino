#include "SPI.h"
#include "Adafruit_GFX.h"
#include "Adafruit_ILI9341.h"

const int A_BUTTON_PIN = 2; // Button A pin
const int B_BUTTON_PIN = 4; // Button B pin
const int DebounceDelay = 10; // Debounce time
const int speakerPin = 3; //設定speakerPin為9(PWM)

#define TFT_CLK 13 // CLK pin
#define TFT_MISO 12 // MISO pin 
#define TFT_MOSI 11 // MOSI pin
#define TFT_DC 10 // DC pin
#define TFT_CS 8 // CS pin
#define TFT_RST 9 // PST pin
//建立LCD class
Adafruit_ILI9341 tft = Adafruit_ILI9341(TFT_CS, TFT_DC, TFT_MOSI, TFT_CLK, TFT_RST, TFT_MISO);

unsigned int frequencies[] = {262, 294, 330, 349, 392, 440, 494}; //音符對應的頻率
int melody_bee[] = { //小蜜蜂樂譜
  5,3,3,4,2,2,1,2,3,4,5,5,5,5,3,3,4,2,2,1,3,5,5,3,2,2,2,2,2,3,4,3,3,3,3,3,4,5,5,3,3,4,2,2,1,3,5,5,1
};
const byte scoreLen_bee = sizeof(melody_bee); //計算小蜜蜂樂譜長度
int beats_bee[scoreLen_bee] = { //小蜜蜂音符間隔時間
  1,1,2,1,1,2,1,1,1,1,1,1,2,1,1,2,1,1,2,1,1,1,1,4,1,1,1,1,1,1,2,1,1,1,1,1,1,2,1,1,2,1,1,2,1,1,1,1,4
};

int melody_star[] = { //小星星樂譜
  1,1,5,5,6,6,5,4,4,3,3,2,2,1,5,5,4,4,3,3,2,5,5,4,4,3,3,2,1,1,5,5,6,6,5,4,4,3,3,2,2,1
};
const byte scoreLen_star = sizeof(melody_star); //計算小星星樂譜長度
int beats_star[scoreLen_star] = { //小星星音符間隔時間
  1,1,1,1,1,1,2, 1,1,1,1,1,1,2,1,1,1,1,1,1,2, 1,1,1,1,1,1,2,1,1,1,1,1,1,2, 1,1,1,1,1,1,2
};

void setup() {
  Serial.begin(9600);
  Serial.println("ILI9341 Test!"); 
  pinMode(A_BUTTON_PIN, INPUT); // set button A is input
  pinMode(B_BUTTON_PIN, INPUT); // set button B is input

  tft.begin();

  // read diagnostics (optional but can help debug problems)
  uint8_t x = tft.readcommand8(ILI9341_RDMODE);
  Serial.print("Display Power Mode: 0x"); Serial.println(x, HEX);
  x = tft.readcommand8(ILI9341_RDMADCTL);
  Serial.print("MADCTL Mode: 0x"); Serial.println(x, HEX);
  x = tft.readcommand8(ILI9341_RDPIXFMT);
  Serial.print("Pixel Format: 0x"); Serial.println(x, HEX);
  x = tft.readcommand8(ILI9341_RDIMGFMT);
  Serial.print("Image Format: 0x"); Serial.println(x, HEX);
  x = tft.readcommand8(ILI9341_RDSELFDIAG);
  Serial.print("Self Diagnostic: 0x"); Serial.println(x, HEX); 

  tft.fillScreen(ILI9341_BLACK); //螢幕變黑

  Serial.println(F("Done!"));
}

int A_button_state = HIGH; //初始A按鈕為HIGH
int B_button_state = HIGH; //初始B按鈕為HIGH
int lastA, lastB; //儲存按鈕狀態

void loop(void) {
  testText(); //顯示文字(歌單)
  
  A_button_state = debounce(A_BUTTON_PIN); //偵測A按鈕狀態
  B_button_state = debounce(B_BUTTON_PIN); //偵測B按鈕狀態

  if(A_button_state == LOW) //A按鈕被按下
  {
    Serial.println("inA");
    lastA = 1;
    lastB = 0;
  }
  
  if(B_button_state == LOW) //B按鈕被按下
  {
    Serial.println("inB");
    lastA = 0;
    lastB = 1;
  }
  if(lastA == 1 && lastB == 0) //A按鈕被按下
  {
    testRects_song1(ILI9341_RED);
    testRects_song2(ILI9341_BLACK);
    
    for(int i=0 ; i<scoreLen_bee ; i++) //播放小蜜蜂
    {
      B_button_state = debounce(B_BUTTON_PIN); //時時刻刻偵測B按鈕狀態
      if(B_button_state == LOW) //當B按鈕按下
      {
        lastA = 0; //變成播放小星星的狀態
        lastB = 1; //變成播放小星星的狀態
        break; //結束播放小蜜蜂
      }
      tone(speakerPin, frequencies[melody_bee[i]-1]);
      delay(beats_bee[i]*250); 
      noTone(speakerPin);
      if(i == 48) break;
    }
    Serial.println("out_bee");
  }
 
  if(lastA == 0 && lastB == 1) //B按鈕被按下
  {
    testRects_song1(ILI9341_BLACK);
    testRects_song2(ILI9341_RED);
    
    for(int i=0 ; i<scoreLen_star ; i++)
    {
      
      A_button_state = debounce(A_BUTTON_PIN); //時時刻刻偵測A按鈕狀態
      if(A_button_state == LOW)//當A按鈕按下
      {
        lastA = 1; //變成播放小蜜蜂的狀態
        lastB = 0; //變成播放小蜜蜂的狀態
        break;
      }
      tone(speakerPin, frequencies[melody_star[i]-1]);
      delay(beats_star[i]*250); 
      noTone(speakerPin);
      if(i == 41) break;
    }      
  }
}

unsigned long testFillScreen() {
  unsigned long start = micros();
  tft.fillScreen(ILI9341_BLACK);
  yield();
  tft.fillScreen(ILI9341_RED);
  yield();
  tft.fillScreen(ILI9341_GREEN);
  yield();
  tft.fillScreen(ILI9341_BLUE);
  yield();
  tft.fillScreen(ILI9341_BLACK);
  yield();
  return micros() - start;
}

unsigned long testText() {
  Serial.println("in1");
  unsigned long start = micros();
  tft.setCursor(20, 70);
  tft.setTextColor(ILI9341_WHITE);  
  tft.setTextSize(3);
  tft.println("little bee");
  tft.setCursor(20, 150);
  tft.println("little star");
  
  return micros() - start;
}

unsigned long testRects_song1(uint16_t color) {
  unsigned long start;

  start = micros();
  
  tft.drawRect(20, 65, 200, 30, color);
  
  return micros() - start;
}
unsigned long testRects_song2(uint16_t color) {
  unsigned long start;

  start = micros();
  
  tft.drawRect(20, 145, 200, 30, color);
  
  return micros() - start;
}
bool debounce(int pin) // debounce the time
{
  bool previousState, state;

  previousState = digitalRead(pin);

  for(int counter=0 ; counter<DebounceDelay ; counter++)
  {
    state = digitalRead(pin);
    if(state != previousState)
    {
      counter = 0;
      previousState = state;
    }
  }
  return state;
}
