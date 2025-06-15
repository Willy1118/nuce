const int speakerPin = 3; //設定speakerPin為9(PWM)
const int ledPin = 5; //設定LED Pin為5

unsigned int frequencies[] = {262, 294, 330, 349, 392, 440, 494}; //音符對應的頻率
int melody[] = { //樂譜
  5,3,3,4,2,2,
  1,2,3,4,5,5,5,
  5,3,3,4,2,2,
  1,3,5,5,3,2,
  2,2,2,2,3,4,
  3,3,3,3,3,4,5,
  5,3,3,4,2,2,
  1,3,5,5,1
};
const byte scoreLen = sizeof(melody); //計算樂譜長度
int beats[scoreLen] = { //音符間隔時間
  1,1,2,1,1,2,
  1,1,1,1,1,1,2,
  1,1,2,1,1,2,
  1,1,1,1,4,1,
  1,1,1,1,1,2,
  1,1,1,1,1,1,2,
  1,1,2,1,1,2,
  1,1,1,1,4
};

int brightness = 85; //LED燈初始亮度
int changeval = 85; //改變亮度

void setup() {
  Serial.begin(9600);
  
}

void loop() 
{
  for(int i=0 ; i<scoreLen ; i++)
  {
    fadeLED();
    tone(speakerPin, frequencies[melody[i]-1]);
    delay(beats[i]*250); 
    noTone(speakerPin);
  }
  brightness = 85; //LED燈初始亮度
  changeval = 85;
  
  delay(4000);
}

void fadeLED()
{
  analogWrite(ledPin, brightness); //LED亮

  brightness += changeval; //改變亮度

  if(brightness >= 255 || brightness <= 0) //當亮度超過255或小於0，將改變頻率的值*-1
  {
    changeval = -1 * changeval;
  }
  delay(2);
}
