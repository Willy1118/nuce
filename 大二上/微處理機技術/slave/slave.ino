const int ButtonPin = 2;   // Slave Arduino按鍵的引腳
const int LedPin = 13;     // Slave Arduino內建LED的引腳
const char signalToMaster = 'P'; // 信號給Master的標示
const int DebounceDelay = 10; //設定debounce時間

void setup() {
  pinMode(ButtonPin, INPUT);
  pinMode(LedPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if (digitalRead(ButtonPin) == LOW) 
  {
    Serial.write(signalToMaster);
    delay(500);
  }

  if (Serial.available() > 0) {
    char receivedChar = Serial.read();
    if (receivedChar == 'S') {
      digitalWrite(slaveLedPin, HIGH);
      delay(200);
      digitalWrite(slaveLedPin, LOW);
      delay(200);
    }
  }
}
