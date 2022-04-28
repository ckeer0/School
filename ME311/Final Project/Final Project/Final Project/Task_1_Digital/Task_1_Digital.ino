#include <Romi32U4.h>
Romi32U4LCD lcd;
int digital_distance=A3;

void setup() {
  // put your setup code here, to run once:
pinMode(digital_distance,INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
int digitalValue=digitalRead(digital_distance);
lcd.clear();
lcd.print(digitalValue);
delay(100);

}
