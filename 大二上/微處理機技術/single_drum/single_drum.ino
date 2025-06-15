//#define B0 31
#define C1 33
#define CS1 35
#define D1 37
#define DS1 39
#define E1 41
#define F1 44
#define FS1 46
#define G1 49
#define GS1 52
#define A1 55
#define AS1 58
//#define B1 62
#define C2 65
#define CS2 69
#define D2 73
//#define D2 78
#define E2 82
#define F2 87
#define FS2 93
#define G2 98
#define GS2 104
#define A2 110
//#define AS2 117
#define B2 123
#define C3 131
#define CS3 139
#define D3 147
#define DS3 156
#define E3 165
#define F3 175
#define FS3 185
#define G3 196
#define GS3 208
#define A3 220
#define AS3 233
#define B3 247
#define C4 262
#define CS4 277
#define D4 294
#define DS4 311
#define E4 330
#define F4 349
#define FS4 370
#define G4 392
#define GS4 415
#define A4 440
#define AS4 466
#define B4 494
#define C5 523
#define CS5 554
#define D5 587
#define DS5 622
#define E5 659
#define F5 698
#define FS5 740
#define G5 784
#define GS5 831
#define A5 880
#define AS5 932
#define B5 988
#define C6 1047
#define CS6 1109
#define D6 1175
#define DS6 1245
#define E6 1319
#define F6 1397
#define FS6 1480
#define G6 1568
#define GS6 1661
#define A6 1760
#define AS6 1865
#define B6 1976
#define C7 2093
#define CS7 2217
#define D7 2349
#define DS7 2489
#define E7 2637
#define F7 2794
#define FS7 2960
#define G7 3136
#define GS7 3322
#define A7 3520
#define AS7 3729
#define B7 3951
#define C8 4186
#define CS8 4435
#define D8 4699
#define DS8 4978
#define REST 0


#include <Adafruit_GFX.h>      // include Adafruit graphics library
#include <Adafruit_ILI9341.h>  // include Adafruit ILI9341 TFT library

#define TFT_CLK 13
#define TFT_MISO 12
#define TFT_MOSI 11
#define TFT_DC 10
#define TFT_RST 9
#define TFT_CS 8
Adafruit_ILI9341 tft = Adafruit_ILI9341(TFT_CS, TFT_DC, TFT_RST);

//---------------------------------------------------------------------------
const int speaker=6;
int melody[48]={C4,C4,G4,G4,E4,E4,G4,REST,F4,F4,E4,E4,D4,D4,C4,REST,G4,G4,F4,F4,E4,E4,D4,REST,G4,G4,F4,F4,E4,E4,D4,
REST,C4,C4,G4,G4,E4,E4,G4,REST,F4,F4,E4,E4,D4,D4,C4,REST
                  };//歌
int notecolor[48]={0,0,1,1,0,0,1,2,1,1,0,0,1,1,0,2,1,1,0,0,1,1,0,2,1,1,0,0,1,1,0,2,0,0,1,1,0,0,1,2,1,1,0,0,1,1,0,2};
//---------------------------------------------------------------------------
void setup() {
  Serial.begin(9600);
  pinMode(2, INPUT);  //"上一個"按鈕 red
  //pinMode(6, OUTPUT);//speaker
  pinMode(3, INPUT);  //"下一個"按鈕 blue
  
  randomSeed(analogRead(0));

  cli();
  TCCR1A = 0;
  TCCR1B = 0;

  TCCR1B |= B00000100;

  TIMSK1 |= B00000010;

  OCR1A = 31250;
  sei();

  attachInterrupt(1, Redchanger, LOW);
  attachInterrupt(0, Bluechanger, LOW);
  tft.begin();
  tft.fillScreen(ILI9341_BLACK);  //default background :black //looks good
  tft.setRotation(3);
}
int dotx = 10, doty = 12;  //implies which song you're selecting
int Red_Circle = 0, Blue_Circle = 0;
int SongEnd=0,score=0;
volatile int Bluehit = 0, Redhit = 0;
bool Song_Select = 0;     //選歌了嗎? 預設是沒有
int debounceDelay = 100;  //debounce delay (ms)
volatile int Bluetmp, Redtmp;
int notepos[8] = { 300, 260, 220, 180, 140, 100, 60, 20 };
int fresh = 0;
char receive ;

void loop() {
  if (Song_Select == 1) {  //選歌了
    tft.drawCircle(300, 120, 17, ILI9341_WHITE);  // 判定圈
  } 
  else {                                        //還沒選
    //Noterandomizer();
    Song_Menu();  //顯示歌單
    for (int i = 0; i < 48; i++) {
      if (Song_Select == 1) {
        break;
      }
      int duration = 333;  //each note lasts for a third of a second
      Serial.print("music: ");Serial.println((doty-12)/24); // tells you which music is being played now
      tone(speaker, melody[i], 400);
      /*if(Serial.available() > 0)
      {
        receive = Serial.read();
        Serial.println(receive);
        if(receive == 'M') {
          dot();
        }
      }*/
      dot();
      delay(500);  //pause to separate the notes
      if(i==47) delay(3000);
    }
  }
  if(SongEnd){
    tft.setCursor(0,45);
    tft.println("Track Complete");
    delay(3000);
    tft.fillScreen(ILI9341_BLACK);
    SongEnd=0;
    score=0;
  }
}
unsigned long dot() {
  if (digitalRead(2) == 0 && digitalRead(3) == 0 && debounced()) {  //兩個按鈕一起按會視為選歌
    Serial.println("Song Selected");
    Song_Select = 1;
    
  } 
  /*else if (digitalRead(2) == 0 && debounced()) {  //the dot control
    tft.fillCircle(dotx, doty, 3, ILI9341_BLACK);
    doty -= 24;
    if (doty == -12) doty = 60;  //邊界處理
  }
  if (digitalRead(3) == 0 && debounced()) {  //the dot control
    tft.fillCircle(dotx, doty, 3, ILI9341_BLACK);
    doty += 24;
    if (doty == 84) doty = 12;  //邊界處理
  }*/
  tft.fillCircle(dotx, doty, 3, ILI9341_WHITE);
}
int asd;
void Redchanger() {  //硬體中斷
  if (Song_Select && debounced() && asd==0) {
    printscore();
  }
}
void Bluechanger() {  //硬體中斷
  if (Song_Select && debounced() && asd==1) {
        printscore();
    }
}
void printscore(){ //print the current score
  tft.setCursor(0,70);
  tft.setTextColor(ILI9341_BLACK);
  tft.print("Score ");
  tft.print(score);
  score++;
  tft.setCursor(0,70);
  tft.setTextColor(ILI9341_WHITE);
  tft.print("Score ");
  tft.print(score);
}
unsigned long Song_Menu() {  //歌單
  unsigned long start = micros();
  tft.setCursor(0, 0);
  tft.setTextColor(ILI9341_WHITE);
  tft.setTextSize(3);
  tft.println(" Star");
  return micros() - start;
}

boolean debounced() {                      //check if debounced
  static unsigned long lastMillis = 0;     //record last millis
  unsigned long currentMillis = millis();  //get current elapsed time
  if ((currentMillis - lastMillis) > debounceDelay) {
    lastMillis = currentMillis;  //update lastMillis with currentMillis
    return true;                 //debounced
  } else {
    return false;  //not debounced
  }
}
int i = 0;
/*if (!fresh && Song_Select) { //考慮拿掉
    tft.fillScreen(ILI9341_BLACK);
    fresh = 1;
  }*/
ISR(TIMER1_COMPA_vect) { //timer interrupt, deal with music notes and music itself
  if (i < 48 && Song_Select) {
    tone(speaker, melody[i], 400);
    for (int j = 0; j < 8; ++j) {
      if(i+j==54){
        Song_Select=0;
        SongEnd=1;
        i=0;
        receive = 'C';
        break;
      }
      if(j==0)
        asd=notecolor[i+j];
      if (notecolor[i + j] == 0) {
        tft.drawCircle(300 - 40 * j, 120, 15, ILI9341_RED);
      }
      if (notecolor[i + j] == 1) {
        tft.drawCircle(300 - 40 * j, 120, 15, ILI9341_BLUE);
      }
      if (notecolor[i + j] == 2) {
        tft.drawCircle(300 - 40 * j, 120, 15, ILI9341_BLACK);
      }
    }
    i++;
  }
  TCNT1 = 0;
}
/*void Noterandomizer() { 
  for (int i = 0; i < 8; i++)
    notecolor[i] = random(2);
}*/
