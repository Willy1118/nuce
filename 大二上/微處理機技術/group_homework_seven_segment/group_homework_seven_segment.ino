const int dataPin = 9; //設定DIO pin腳
const int clockPin = 10; //設定CLK pin腳
const int strobePin = 11; //設定STB pin腳
const int frequency = 100; //閃爍頻率

byte shape[9] = {
  B00100001, //S1圖案
  B01100000, //S2圖案
  B01000100, //S3圖案
  B00001100, //S4圖案
  B00011000, //S5圖案
  B01010000, //S6圖案
  B01000010, //S7圖案
  B00000011, //S8圖案
  B00000000  //全暗
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

  for(int i=0 ; i<8 ; i++) 
  {
    setSegNum(address[i], shape[i]);
  }
}

int state[8] = {0}; //儲存8個

void loop() 
{
  int button = get_Button(); //讀取案件狀態
  byte bright = 00000000; //將閃爍的圖案or在bright(實現圖案合併)
  int amount = 0; //計算有多少個按鈕被按下

  for(int i=0 ; i<8 ; i++) //將8個按鈕的狀態存在state陣列(將十進制轉成二進制)
  {
    state[i] = button % 2;
    button /= 2;
  }
  
  for(int i=0 ; i<8 ; i++)
  {
    if(state[i] == 1) //當第i個按鈕為1時 表示該按鈕被按下
    {
      bright = bright | shape[i]; //將圖案or在一起
      amount ++; //計算有多少按鈕被按下
    }
  }

  if(amount != 0) //當amount不等於零時 代表有按鈕被按下 需要閃爍
  {
    for(int i=0 ; i<8 ; i++) //讓所有按下去的按鈕閃爍bright的圖形(or完的)
    {
      if(state[i] == 1) 
      {
        setSegNum(address[i], bright);
      }
    }
    delay(frequency); //延遲100ms
    for(int i=0 ; i<8 ; i++) //讓所有按下去的按鈕熄滅
    {
      if(state[i] == 1) 
      {
        setSegNum(address[i], shape[8]);
      }
    }
    delay(frequency); //延遲100ms
  }
  for(int i=0 ; i<8 ; i++) //讓所有按鈕復位
  {
    setSegNum(address[i], shape[i]);
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

byte get_Button() //讀取按鍵回傳的函數
{
  byte keys = 0x00; //初設keys為0x00(表示沒有顯示資料)
  digitalWrite(strobePin, LOW);

  sendByte(0x42); //開始執行從鍵盤讀入內容

  for(int i=0 ; i<4 ; i++) //開始分別讀取4的byte(byte0 ,byte1, byte2, byte3)
  {
    byte temp = get_byte();
    keys |= (temp << i); //將temp內部獲得的資料左移i格，然後合併到keys內部
  }
  digitalWrite(strobePin, HIGH);
  return keys;
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

void sendByte2(byte data) //參數data  1個byte的使用者資料
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
