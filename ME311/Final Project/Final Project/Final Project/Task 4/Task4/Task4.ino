//Include the necessary libraries
#include <Wire.h>
#include <Romi32U4.h>
#include <LSM6.h>
#include "TurnSensor.h"

//Map the functions to variables
Romi32U4LCD lcd;
Romi32U4ButtonA buttonA;
Romi32U4Motors motors;
LSM6 imu;
Romi32U4Buzzer buzzer;


//Define variables
int a;
int Angle;
double x;
double y;
double z;
double x_init;
double y_init;
double z_init;
double y_init_buf;
int minVal = 265;
int maxVal = 402;
const int maxSpeed = 50;
int analog_distance = A0;
int counter = 0;
int Distance;
int counter2 = 0;


void setup() {
  // put your setup code here, to run once:
  pinMode(analog_distance, INPUT);
  //Initialize I2C
  Wire.begin();

  //Check if the IMU is responding
  if (!imu.init())
  {
    // Failed to detect the LSM6.
    ledRed(1);
    while (1)
    {
      Serial.println(F("Failed to detect the LSM6."));
      delay(100);
    }
  }


  //Enable default modes for gyro and accelerometer
  imu.enableDefault();
  imu.writeReg(LSM6::CTRL1_XL, 0b10000100);
  imu.writeReg(LSM6::CTRL2_G, 0b10001000);

  //Print a setup message
  lcd.clear();
  lcd.print("Setup");




  for (int i = 0; i <= 1000; i++) {
    imu.read();
    int xAng = map(imu.a.x - 34, minVal, maxVal, -90, 90);
    int yAng = map(imu.a.y - 25, minVal, maxVal, -90, 90);
    int zAng = map(imu.a.z - 13, minVal, maxVal, -90, 90);

    x_init = RAD_TO_DEG * (atan2(-yAng, -zAng) + PI);
    y_init = RAD_TO_DEG * (atan2(-xAng, -zAng) + PI);
    z_init = RAD_TO_DEG * (atan2(-yAng, -xAng) + PI);

    y_init_buf = y_init_buf + y_init;
  }




  //Divide the sample by the number of samples to get the average bias
  y_init_buf = y_init_buf / 1001;

  //Calibrate the gyro and start gyro data stream
  turnSensorSetup();

  //Convert raw gyro data into angles turned
  Angle = (((int32_t)turnAngle >> 16) * 360) >> 16;

  //Print calculated angle on lcd
  lcd.print(Angle);

  //Wait for the A button to be pressed
  buttonA.waitForButton();

  //Wait 5 seconds
  delay(5000);



}

void loop() {
  // put your main code here, to run repeatedly:
 
  //Get the Current heading and distance and display it to the lcd
  Angle = IMU();
  Distance = ReadDistance();
  LCD(Angle, Distance);
  counter2=0;
  counter=0;
  
  //Start Driving Forward
  motors.setSpeeds(50, 50);


  //Check if there is an obstical
  if (Distance <= 3) {
    buzzer.play("c32");
    counter=0;
    while (counter2==0) {
      //Beep and turn left 90 degrees
      Angle = IMU();
      Distance = ReadDistance();
      LCD(Angle, Distance);
      while (counter == 0) {
        turnLeft();
        counter = 1;
      }
      //check to see if there is something immediately in front after turning and turn around
      if (Distance <= 3) {
        buzzer.play("c32");
        counter = 0;
        while (counter == 0) {
          turnRight();
          motors.setSpeeds(50,50);
          delay(5000);
         
          counter = 1;
        }
      }
      else {
        //If there is nothing drive forward for a second and then turn to center 
        motors.setSpeeds(50, 50);
        delay(1000);
        turnCenter();
        counter2=1;
      }


      delay(50);
    }
    delay(50);
  }
  delay(50);
}










//Function that gets the current heading
int IMU () {
  turnSensorUpdate();
  Angle = (((int32_t)turnAngle >> 16) * 360) >> 16;
  return Angle;
}
//Function that gets the current distance
int ReadDistance () {
  int analogValue = analogRead(A0);
  int Distance = 154881 / pow(analogValue, 1.6181229);
  return Distance;
}
//Function that displays the information to the LCD
int LCD (int Angle, int Distance) {
  lcd.clear();
  lcd.print(Angle);
  lcd.gotoXY(0, 1);
  lcd.print(Distance);
}


//Function that turns to a -90 heading
int turnRight () {
  motors.setSpeeds(0, 0);
  int count = 0;
  while (count == 0) {

    //Get all necessary data and display
    Angle = IMU();
    Distance = ReadDistance();
    LCD(Angle, Distance);

    //Rotate the robot till it reaches a heading of -90 degrees
    if (Angle > -90) {
      motors.setSpeeds(maxSpeed, -maxSpeed);
    }
    if (Angle < -90) {
      motors.setSpeeds(-maxSpeed, maxSpeed);
    }
    if (Angle == -90) {
      motors.setSpeeds(0, 0);
      delay(1000);
      count = 1;
      break;
    }
    delay(50);
  }
  return 0;
}

//Funtion that turns to a heading of 90 degrees
int turnLeft () {
  motors.setSpeeds(0, 0);
  int count = 0;
  while (count == 0) {

    //Get all necessary data and display
    Angle = IMU();
    Distance = ReadDistance();
    LCD(Angle, Distance);

    //Rotate the robot till it reaches a heading of 90 degrees
    if (Angle > 90) {
      motors.setSpeeds(maxSpeed, -maxSpeed);
    }
    if (Angle < 90) {
      motors.setSpeeds(-maxSpeed, maxSpeed);
    }
    if (Angle == 90) {
      motors.setSpeeds(0, 0);
      delay(1000);
      count = 1;
      break;
    }
    delay(50);
  }
  return 0;
}


//function that turns to a heading of 0 degrees
int turnCenter () {
  motors.setSpeeds(0, 0);
  int count = 0;
  while (count == 0) {

    //Get all necessary data and display
    Angle = IMU();
    Distance = ReadDistance();
    LCD(Angle, Distance);

    //Rotate the robot till it reaches a heading of 0 degrees
    if (Angle > 0) {
      motors.setSpeeds(maxSpeed, -maxSpeed);
    }
    if (Angle < 0) {
      motors.setSpeeds(-maxSpeed, maxSpeed);
    }
    if (Angle == 0) {
      motors.setSpeeds(0, 0);
      delay(1000);
      count = 1;
      break;
    }
    delay(50);
  }
  return 0;
}
