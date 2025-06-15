int f;
char enter;
void setup() {
  Serial.begin(9600);
  pinMode(13,OUTPUT);
  Serial.println("請輸入一個整數(0~100)：");
}

void loop() {
  if(Serial.available()>0)
  {
      f = Serial.parseInt();
      Serial.println(f);
      enter = Serial.read();
      Serial.println("請輸入一個整數(0~100)：");     
  }
  digitalWrite(13,HIGH);
  delay(f);
  digitalWrite(13,LOW);
  delay(f);
}Z
