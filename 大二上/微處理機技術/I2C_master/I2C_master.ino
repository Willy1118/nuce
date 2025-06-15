#include<Wire.h>

int A_BUTTON_PIN = 3;
int B_BUTTON_PIN = 4;
char signalToSlave1 = '1';
char signalToSlave2 = '2';
const int dataPin = 9; //設定DIO pin腳
const int clockPin = 10; //設定CLK pin腳
const int strobePin = 11; //設定STB pin腳
const int dataPin2 = 5; //設定DIO pin腳
const int clockPin2 = 6; //設定CLK pin腳
const int strobePin2 = 7; //設定STB pin腳

byte address[8] = { //設定七段顯示器位置
  0xC0, 0xC2, 0xC4, 0xC6,
  0xC8, 0xCA, 0xCC, 0xCE
};

byte number[10] = { //數字0~9
  B00111111, //0
  B00000110, //1
  B01011011, //2
  B01001111, //3
  B01100110, //4
  B01101101, //5
  B01111101, //6
  B00000111, //7
  B01111111, //8
  B01100111, //9
};

void setup() {
  Wire.begin();
  Serial.begin(9600);
  pinMode(A_BUTTON_PIN, INPUT);
  pinMode(B_BUTTON_PIN, INPUT);

  pinMode(dataPin, OUTPUT);
  pinMode(clockPin, OUTPUT);
  pinMode(strobePin, OUTPUT);

  //將strobe和clock設為HIGH以便後續sendCommand
  digitalWrite(strobePin, HIGH);
  digitalWrite(clockPin, HIGH);

  sendCommand(0x40); //設定為數據寫入模式
  sendCommand(0x88); //開啟板子上的顯示元件

  pinMode(dataPin2, OUTPUT);
  pinMode(clockPin2, OUTPUT);
  pinMode(strobePin2, OUTPUT);

  //將strobe和clock設為HIGH以便後續sendCommand
  digitalWrite(strobePin2, HIGH);
  digitalWrite(clockPin2, HIGH);

  sendCommand2(0x40); //設定為數據寫入模式
  sendCommand2(0x88); //開啟板子上的顯示元件

  for(int i=0 ; i<8 ; i++) //一開始全暗
  {
    setSegNum(address[i], B00000000);
    setSegNum2(address[i], B00000000);
  }

  //倒數321
  setSegNum(address[7], number[0]);
  setSegNum2(address[7], number[1]);
}

void loop() {
  
  if(digitalRead(A_BUTTON_PIN) == LOW)
  {
    Wire.beginTransmission(8);
    Wire.write(signalToSlave1);
    delay(500);
    Wire.endTransmission();
  }

  
  if(digitalRead(B_BUTTON_PIN) == LOW)
  {
    Wire.beginTransmission(9);
    Wire.write(signalToSlave2);
    delay(500);
    Wire.endTransmission();
  }
  
  
  Wire.requestFrom(8, 1);
  while(Wire.available())
  {
    char c = Wire.read();
    Serial.println(c);
    if(c == '0') setSegNum(address[7], number[0]);
    else if(c == '1') setSegNum(address[7], number[1]);
  }
  
  Wire.requestFrom(9, 1);
  while(Wire.available())
  {
    int c = Wire.read();
    Serial.println("in");
    int tenth = c / 10; //分數的十位數
    int ones = c % 10; //分數的個位數
    if(c >= 10) setSegNum2(address[6], number[tenth]); //在第6個位子顯示十位數
    setSegNum2(address[7], number[ones]); //在第7個位子顯示個位數
  }

}

byte get_byte() {
  byte data = 0x00;
  pinMode(dataPin, INPUT); //將dataPin改為input
  
  for (int i = 0; i < 8; i++) 
  {
    digitalWrite(clockPin, LOW); //將clockPin從high轉low,將data從dataPin輸出一個bit
    if(digitalRead(dataPin)) //若讀取到high
    { 
      data |= (0x01 << i); //將對應bit位置轉為1
    }
    digitalWrite(clockPin, HIGH); //將clockPin復位為high
  }
  pinMode(dataPin, OUTPUT); //將dataPin復位為output
  return data;
}
void sendCommand(byte cmd) //設定strobe以輸入1個byte的資料
{
  digitalWrite(strobePin,LOW);
  sendByte(cmd);
  digitalWrite(strobePin,HIGH);
}

void sendByte(byte data) //參數data  1個byte的使用者資料
{
  for (int i = 0; i < 8; i++) //產生8個clock方波(週期)
  {
    digitalWrite(clockPin, LOW);
    digitalWrite(dataPin, (data & 1 ? HIGH : LOW)); //利用datapin一次輸出最右邊一個data bit
    data >>= 1;
    digitalWrite(clockPin, HIGH);
  }
}

void setSegNum(byte seg_address, byte pattern) //seg_address: 七段顯示器暫存器的位置
{                                              //pattern: 要對這個暫存器寫入甚麼內容
  digitalWrite(strobePin, LOW); //開始進行輸入
  sendByte(seg_address); //cmd2: 指定寫入的七段顯示器位置
  sendByte(pattern); //寫入要顯示的圖案內容
  digitalWrite(strobePin, HIGH); //結束輸入
}






byte get_byte2() {
  byte data = 0x00;
  pinMode(dataPin2, INPUT); //將dataPin改為input
  
  for (int i = 0; i < 8; i++) 
  {
    digitalWrite(clockPin2, LOW); //將clockPin從high轉low,將data從dataPin輸出一個bit
    if(digitalRead(dataPin2)) //若讀取到high
    { 
      data |= (0x01 << i); //將對應bit位置轉為1
    }
    digitalWrite(clockPin2, HIGH); //將clockPin復位為high
  }
  pinMode(dataPin2, OUTPUT); //將dataPin復位為output
  return data;
}
void sendCommand2(byte cmd) //設定strobe以輸入1個byte的資料
{
  digitalWrite(strobePin2,LOW);
  sendByte2(cmd);
  digitalWrite(strobePin2,HIGH);
}

void sendByte2(byte data) //參數data  1個byte的使用者資料
{
  for (int i = 0; i < 8; i++) //產生8個clock方波(週期)
  {
    digitalWrite(clockPin2, LOW);
    digitalWrite(dataPin2, (data & 1 ? HIGH : LOW)); //利用datapin一次輸出最右邊一個data bit
    data >>= 1;
    digitalWrite(clockPin2, HIGH);
  }
}

void setSegNum2(byte seg_address, byte pattern) //seg_address: 七段顯示器暫存器的位置
{                                              //pattern: 要對這個暫存器寫入甚麼內容
  digitalWrite(strobePin2, LOW); //開始進行輸入
  sendByte2(seg_address); //cmd2: 指定寫入的七段顯示器位置
  sendByte2(pattern); //寫入要顯示的圖案內容
  digitalWrite(strobePin2, HIGH); //結束輸入
}
