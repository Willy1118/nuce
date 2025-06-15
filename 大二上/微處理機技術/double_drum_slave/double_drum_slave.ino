const int A_BUTTON_PIN = 3;
const int B_BUTTON_PIN = 4;
const int DebounceDelay=10;

const char signalToMaster = 'M';

void setup() {
  pinMode(A_BUTTON_PIN, INPUT);
  pinMode(B_BUTTON_PIN, INPUT);
  Serial.begin(9600);
}

void loop() {
  if (debounce(A_BUTTON_PIN) == LOW) {  //兩個按鈕一起按會視為選歌
    //Serial.println("Song Selected");
    Serial.write(signalToMaster);
    delay(500);
  }
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
