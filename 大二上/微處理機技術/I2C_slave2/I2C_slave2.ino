#include<Wire.h>

const int dataPin = 9; //設定DIO pin腳
const int clockPin = 10; //設定CLK pin腳
const int strobePin = 11; //設定STB pin腳
const int LED = 13;
const int buttonPin = 3;

int x = 0;
int bright = 0;

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
  pinMode(LED, OUTPUT);
  Wire.begin(9);
  Wire.onReceive(receiveEvent);
  Wire.onRequest(requestEvent);

  pinMode(dataPin, OUTPUT);
  pinMode(clockPin, OUTPUT);
  pinMode(strobePin, OUTPUT);

  //將strobe和clock設為HIGH以便後續sendCommand
  digitalWrite(strobePin, HIGH);
  digitalWrite(clockPin, HIGH);

  sendCommand(0x40); //設定為數據寫入模式
  sendCommand(0x88); //開啟板子上的顯示元件

  for(int i=0 ; i<8 ; i++) //一開始全暗
  {
    setSegNum(address[i], B00000000);
  }

  setSegNum(address[7], number[0]);
}

void loop() {
  if(digitalRead(buttonPin) == LOW)
  {
    x ++ ;
    int tenth = x / 10; //分數的十位數
    int ones = x % 10; //分數的個位數
    if(x >= 10) setSegNum(address[6], number[tenth]); //在第6個位子顯示十位數
    setSegNum(address[7], number[ones]); //在第7個位子顯示個位數
    delay(500);
  }

}

void receiveEvent(int c)
{
  c = Wire.read();
  if(c == '2')
  {
    if(bright == 0) 
    {
      pinMode(LED, HIGH);
      bright = 1;
    }
    else if(bright == 1) 
    {
      pinMode(LED, LOW);
      bright = 0;
    }
  }
}

void requestEvent()
{
  Wire.write(x);
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
