int num;
char enter;
void setup() {
  // put your setup code here, to run once:
 Serial.begin(9600);
 Serial.println("Enter integer:");
}

void loop() {
  // put your main code here, to run repeatedly:
  //Serial.println("enter int");
  if(Serial.available()>0)
  {
      num = Serial.parseInt();
      Serial.println(num);
      enter = Serial.read();
      if(num%7==0) Serial.println("yes");
      else Serial.println("no"); 
      Serial.println("Enter integer:");
  }
}
