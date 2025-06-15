const int A_BUTTON_PIN = 3; // Button A pin
const int B_BUTTON_PIN = 7; // Button B pin
const int LED_PIN =  13; // LED pin
const int DebounceDelay = 10; // Debounce time

int A_buttonState = 0; // Button A state
int B_buttonState = 0; // Button B state
int LastA=HIGH, LastB=HIGH, A, B;

void setup() {
  Serial.begin(9600);
  pinMode(LED_PIN, OUTPUT);   // set LED's pin is output
  pinMode(A_BUTTON_PIN, INPUT); // set button A is input
  pinMode(B_BUTTON_PIN, INPUT); // set button B is input
}

void loop() {
  A_buttonState = debounce(A_BUTTON_PIN); // read button A state
  B_buttonState = debounce(B_BUTTON_PIN); // read button B state
  
  if(A_buttonState == LOW && B_buttonState == HIGH) // press A
  {         
    digitalWrite(LED_PIN, HIGH); // LED bright
  }
  if(B_buttonState == LOW && A_buttonState == HIGH) // press B
  {                           
    digitalWrite(LED_PIN, LOW);  // LED dark
  }
  if(LastA==LOW && A_buttonState == LOW && LastB == LOW && B_buttonState == LOW) // condition 3
  {
    int f = 50;
    digitalWrite(LED_PIN,HIGH);
    delay(f);
    digitalWrite(LED_PIN,LOW);
    delay(f);      
  }
  if(LastA==LOW && A_buttonState==LOW && LastB==HIGH && B_buttonState==LOW) // conditon 4
  {
    while(1)
    {
      A = debounce(A_BUTTON_PIN);
      B = debounce(B_BUTTON_PIN);
      int f = random(100, 500);
      digitalWrite(LED_PIN, HIGH);
      delay(f);
      digitalWrite(LED_PIN, LOW);
      delay(f);
      if(A == HIGH || B == HIGH) // if button A or button B released, end the condition 4
      {
        break;
      }
    }
  } 
  
  LastA = A_buttonState; // record last state of button A
  LastB = B_buttonState; // record last state of button B
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
