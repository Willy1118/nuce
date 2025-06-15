const int A_BUTTON_PIN = 12; //設定A按鈕PIN腳
const int B_BUTTON_PIN = 8; //設定B按鈕PIN腳
const int LED_PIN = 3; //設定LED PIN腳
const int DebounceDelay = 10; //設定debounce時間
unsigned long previousMillis = 0; //儲存上個時間(用來處理閃爍)
int bright_or_dark = 0; //處理亮與暗(1亮 0暗)
int brightness = 125; //初始設定按鈕亮度為125
int frequency = 500; //初始設定按鈕閃爍頻率為500
int A_button_state, A_button_Press_duration; //按鈕A的狀態與暗的時間
int B_button_state, B_button_Press_duration; //按鈕B的狀態與暗的時間

void setup() {
  Serial.begin(9600);
  pinMode(LED_PIN, OUTPUT); //設定LED的PIN腳為輸出
  pinMode(A_BUTTON_PIN, INPUT); //設定按鈕A的PIN腳為輸入
  pinMode(B_BUTTON_PIN, INPUT); //設定按鈕B的PIN腳為輸入
}

void loop() {
  int startTime = millis(); //開始時間
  unsigned long currentMillis = millis(); //開始時間(頻率用)

  A_button_state = debounce(A_BUTTON_PIN); //讀入按鈕A
  B_button_state = debounce(B_BUTTON_PIN); //讀入按鈕B

  while(A_button_state == LOW) //當按鈕A按下
  {
    currentMillis = millis(); //更新現在時間
    A_button_Press_duration = millis() - startTime; //紀錄A按鈕按下時間
    
    A_button_state = debounce(A_BUTTON_PIN); //確認A按鈕狀態
    if(A_button_state == HIGH) //當按鈕A被放開
    {
      Serial.print("A ");
      Serial.println(A_button_Press_duration);
      break;
    }  
    if(A_button_Press_duration > 1000) //長按(超過1秒)
    {
      brightness = 255; //亮度最大
    }
    if(currentMillis - previousMillis >= frequency) //當現在時間減去以前時間超過頻率，代表要閃爍了
    {
      previousMillis = currentMillis; //更新上一個時間成現在時間
      if(bright_or_dark == 0) bright_or_dark = 1; //當bright_or_dark為0(暗)，變成1(亮)
      else bright_or_dark = 0; //當bright_or_dark為1(亮)，變成0(暗)
    }
    if(bright_or_dark == 1) analogWrite(LED_PIN, brightness); //當bright_or_dark為1，讓LED亮
    if(bright_or_dark == 0) digitalWrite(LED_PIN, LOW); //當bright_or_dark為1，讓LED暗
  }

  while(B_button_state == LOW) //當按鈕B按下
  {
    currentMillis = millis(); //更新現在時間
    B_button_Press_duration = millis() - startTime; //紀錄A按鈕按下時間
    
    B_button_state = debounce(B_BUTTON_PIN); //確認B按鈕狀態
    if(B_button_state == HIGH) //當按鈕B被放開
    {
      Serial.print("B ");
      Serial.println(B_button_Press_duration);
      break;
    }  
    if(B_button_Press_duration > 1000) //長按(超過1秒)
    {
      frequency = 0; //恆亮(頻率為0)
    }
    if(currentMillis - previousMillis >= frequency) //當現在時間減去以前時間超過頻率，代表要閃爍了
    {
      previousMillis = currentMillis; //更新上一個時間成現在時間
      if(bright_or_dark == 0) bright_or_dark = 1; //當bright_or_dark為0(暗)，變成1(亮)
      else bright_or_dark = 0; //當bright_or_dark為1(亮)，變成0(暗)
    }
    if(bright_or_dark == 1) analogWrite(LED_PIN, brightness); //當bright_or_dark為1，讓LED亮
    if(bright_or_dark == 0) digitalWrite(LED_PIN, LOW); //當bright_or_dark為1，讓LED暗
  }

  if(A_button_Press_duration > 1000) A_button_Press_duration = 0; //如果長按A按鈕，把A_button_Press_duration重置
  if(B_button_Press_duration > 1000) B_button_Press_duration = 0; //如果長按B按鈕，把B_button_Press_duration重置

  if(A_button_Press_duration > 1) //當按鈕A有被按下
  {
    int counter = 1; //紀錄按鈕按下次數(1為單擊，2為雙擊)
    for(int i=0 ;i<1 ; i++)
    {
      //A_button_state = debounce(A_BUTTON_PIN);
      delay(100);
      A_button_state = debounce(A_BUTTON_PIN); //偵測按鈕A狀態
      delay(150);
      if(A_button_state == LOW) counter++; //當按鈕A被按下，counter+1(為雙擊)
      
      Serial.print("counter = ");
      Serial.println(counter);
    }
    if(counter == 1) //單擊
    {
      brightness += 25; //亮度加25
      Serial.println(brightness); 
      if(brightness >= 255) //亮度不能超過255
      {
        brightness = 255;
      }
      if(bright_or_dark == 1) analogWrite(LED_PIN, brightness);
    }
    else if(counter == 2) //雙擊
    {
      brightness -= 25; //亮度扣25
      Serial.println(brightness);
      if(bright_or_dark == 1) analogWrite(LED_PIN, brightness); 
      if(brightness <= 0) //亮度不能低於0
      {
        brightness = 0;
      }
    }
  }

  if(B_button_Press_duration > 1) //當按鈕B有被按下
  {
    int counter = 1; //紀錄按鈕按下次數(1為單擊，2為雙擊)
    for(int i=0 ;i<1 ; i++)
    {
      delay(100);
      B_button_state = debounce(B_BUTTON_PIN); //偵測按鈕B狀態
      delay(150);
      Serial.println(B_button_state);
      if(B_button_state == LOW) counter++; //當按鈕B被按下，counter+1(為雙擊)
      
      Serial.print("counter = ");
      Serial.println(counter);
    }
    if(counter == 1) //單擊
    {
      frequency -= 200; //增加閃爍頻率(200)
      Serial.println(frequency);
      if(bright_or_dark == 1) analogWrite(LED_PIN, brightness); 
      if(brightness <= 0) //頻率不能低於0
      {
        brightness = 0;
      }
    }
    else if(counter == 2) //雙擊
    {
      frequency += 200; //減少閃爍頻率(200)
      Serial.println(frequency);
      if(bright_or_dark == 1) analogWrite(LED_PIN, brightness); 
    }
  }

  A_button_Press_duration = 0; //重置按紐A按下的時間
  B_button_Press_duration = 0; //重置按紐B按下的時間
  
  if(currentMillis - previousMillis >= frequency) //當現在時間減去以前時間超過頻率，代表要閃爍了
  {
    previousMillis = currentMillis; //更新上一個時間成現在時間
    if(bright_or_dark == 0) bright_or_dark = 1; //當bright_or_dark為0(暗)，變成1(亮)   
    else bright_or_dark = 0; //當bright_or_dark為1(亮)，變成0(暗)
  }
  if(bright_or_dark == 1) analogWrite(LED_PIN, brightness); //當bright_or_dark為1，讓LED亮
  if(bright_or_dark == 0) digitalWrite(LED_PIN, LOW); //當bright_or_dark為0，讓LED暗
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
