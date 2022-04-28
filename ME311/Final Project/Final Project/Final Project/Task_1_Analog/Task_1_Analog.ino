#include <Romi32U4.h>
Romi32U4LCD lcd;
int analog_distance=A0;


void setup() {
  // put your setup code here, to run once:
pinMode(analog_distance,INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
int analogValue=analogRead(analog_distance);
lcd.clear();
lcd.print(analogValue);
delay(100);

}
