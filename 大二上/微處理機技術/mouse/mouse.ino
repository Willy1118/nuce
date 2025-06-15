const int dataPin = 9; //設定DIO pin腳
const int clockPin = 10; //設定CLK pin腳
const int strobePin = 11; //設定STB pin腳
const int frequency = 500; //老鼠出現的頻率

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

byte mouse[2] = { //全亮(老鼠) 全暗
  B01111111, B00000000
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

  for(int i=0 ; i<8 ; i++) //一開始全暗
  {
    setSegNum(address[i], mouse[1]);
  }

  //倒數321
  setSegNum(address[7], number[3]);
  delay(1000);
  setSegNum(address[7], number[2]);
  delay(1000);
  setSegNum(address[7], number[1]);
  delay(1000);
}

int score = 0, tenth, ones; //分數初始=0 分數的十位數及個位數
int last_place, place; //紀錄上一個老鼠的地方
int mouse_place[8] = {1,2,4,8,16,32,64,128}; //按鈕所代表的數字(S1=1, S2=2, S3=4 ......)

void loop() 
{
  unsigned long previous_time = millis(); //記錄前一個時間
  int r = random(0, 6); 
  while(r == last_place) //讓出現位置不跟前一個一樣
  {
    r = random(0, 6);
  }
  place = r;
  
  setSegNum(address[place], mouse[0]); //在第place的位置顯示老鼠
  while(millis() - previous_time <= frequency) //老鼠的出現頻率為frequency(=500)
  { 
    if(get_Button() == mouse_place[place]) //當按下的按鈕等於老鼠出現的地方
    {  
      score ++ ; //分數加一
      break;
    }
    if(score == 100)  //當分數等於100，歸0
    {
      score = 0;
      setSegNum(address[6], mouse[1]); //讓十位數消失
    }
    
    tenth = score / 10; //分數的十位數
    ones = score % 10; //分數的個位數
    
    if(score >= 10) setSegNum(address[6], number[tenth]); //在第6個位子顯示十位數
    setSegNum(address[7], number[ones]); //在第7個位子顯示個位數

    if(get_Button() == 128) //當按到最右邊的按鈕時
    {
      score = 0; //分數歸零
      for(int i=0 ; i<8 ; i++) //全暗
      {
        setSegNum(address[i], mouse[1]);
      }
    
      //倒數321
      setSegNum(address[7], number[3]);
      delay(1000);
      setSegNum(address[7], number[2]);
      delay(1000);
      setSegNum(address[7], number[1]);
      delay(1000);
      break;
    }
  }
  setSegNum(address[place], mouse[1]); //只要沒在頻率內按下正確的按鈕 或者 按對，都會讓老鼠躲起來，重新取random
  last_place = place; //紀錄上一個老鼠出現的位置(避免重複出現)
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

void setSegNum(byte seg_address, byte pattern) //seg_address: 七段顯示器暫存器的位置
{                                              //pattern: 要對這個暫存器寫入甚麼內容
  digitalWrite(strobePin, LOW); //開始進行輸入
  sendByte(seg_address); //cmd2: 指定寫入的七段顯示器位置
  sendByte(pattern); //寫入要顯示的圖案內容
  digitalWrite(strobePin, HIGH); //結束輸入
}
