const int dataPin = 9; //設定DIO pin腳
const int clockPin = 10; //設定CLK pin腳
const int strobePin = 11; //設定STB pin腳

byte backward[4] = { // 3 2 1 亮的位置和全暗
  B01001111, B01011011, B00000110, B00000000
};

byte pattern1[12] = { //設定亮的位置(0不亮，1亮)
  B01010000, B01011000, B00011000, B00001000, B00000000,
  B01000000, B01100000, B01100001, B00100001, B00000001,
  B00000000, B01000000
};
byte pattern2[12] = { //設定亮的位置(0不亮，1亮)
  B01000000, B00000000, B00001000, B00001100, B01001100,
  B01000100, B01000000, B00000000, B00000001, B00000011,
  B01000011, B01000010
};

byte address[8] = { //設定七段顯示器位置
  0xC0, 0xC2, 0xC4, 0xC6,
  0xC8, 0xCA, 0xCC, 0xCE
};

void setup() {
  Serial.begin(9600);

  //設定腳位為輸出
  pinMode(dataPin, OUTPUT);
  pinMode(clockPin, OUTPUT);
  pinMode(strobePin, OUTPUT);

  //將strobe和clock設為HIGH以便後續sendCommand
  digitalWrite(strobePin, HIGH);
  digitalWrite(clockPin, HIGH);

  sendCommand(0x40); //設定為數據寫入模式
  sendCommand(0x88); //開啟板子上的顯示元件

  for (int i = 0; i < 8; i++) //一開始全暗
  { 
    setSegNum(address[i], backward[3]);
  }
  
  for (int i = 0; i < 3; i++) //倒數 3 2 1 方便觀察
  { 
    setSegNum(address[7], backward[i]);
    delay(1000);
  }
}

void loop() 
{
  for (int i = 0; i < 12; i++) //將12個圖形設為迴圈
  {
    setSegNum(address[6], pattern1[i]); //在右邊數來第二個位置顯示pattern1亮的地方
    setSegNum(address[7], pattern2[i]); //在最右邊顯示pattern2亮的地方
    delay(50);
  }
}

void sendCommand(byte cmd) //設定strobe以輸入1個byte的資料
{
  digitalWrite(strobePin,LOW);
  sendByte(cmd);
  digitalWrite(strobePin,HIGH);
}

void sendByte(byte data)  //參數data  1個byte的使用者資料
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
