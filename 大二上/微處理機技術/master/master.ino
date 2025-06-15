const int ButtonPin = 2;  // Master Arduino按鍵的引腳
const int LedPin = 13;   // Master Arduino內建LED的引腳
const char signalToSlave = 'S';  // 信號給Slave的標示
const int DebounceDelay = 10; // 設定debounce時間
int state = 0; // LED狀態，0代表暗，1代表亮

void setup() {
  pinMode(ButtonPin, INPUT);
  pinMode(LedPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if (digitalRead(ButtonPin) == LOW && state == 1) 
  {
    Serial.write(signalToSlave);
    delay(500);
  }

  if (Serial.available() > 0) {
    char receivedChar = Serial.read();
    if (receivedChar == 'P') {
      if(state == 0) 
      {
        state = 1;
        digitalWrite(masterLedPin, HIGH);
      }
      else 
      {
        state = 0;
        digitalWrite(masterLedPin, LOW);
      }
    }
  }
}
