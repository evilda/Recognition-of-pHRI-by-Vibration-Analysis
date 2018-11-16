#include <SparkFun_ADXL345.h>         // SparkFun ADXL345 Library

/*********** COMMUNICATION SELECTION ***********/
/*    Comment Out The One You Are Not Using    */
//ADXL345 adxl = ADXL345(10);           // USE FOR SPI COMMUNICATION, ADXL345(CS_PIN);
ADXL345 adxl = ADXL345();             // USE FOR I2C COMMUNICATION

/****************** INTERRUPT ******************/
/*      Uncomment If Attaching Interrupt       */
//int interruptPin = 2;                 // Setup pin 2 to be the interrupt pin (for most Arduino Boards)

double mal = 0.25;


/******************** SETUP ********************/
/*          Configure ADXL345 Settings         */
void setup(){
  
  Serial.begin(9600);                 // Start the serial terminal
  
  adxl.powerOn();                     // Power on the ADXL345

  adxl.setRangeSetting(2);           // Give the range settings
                                      // Accepted values are 2g, 4g, 8g or 16g
                                      // Higher Values = Wider Measurement Range
                                      // Lower Values = Greater Sensitivity
  int x,y,z;
  for(int var = 0;var <150;var++)
  {
      
   adxl.readAccel(&x, &y, &z); 
   if(var >100)
   {
    if(abs(x)>480||abs(y)>480||abs(z)>480)
    {
      adxl.setRangeSetting(4);
//      mal = 0.125;
      break;
    }
   }
  }
 

}

/****************** MAIN CODE ******************/
/*     Accelerometer Readings and Interrupt    */
void loop(){
  
  // Accelerometer Readings
  int x,y,z;   
  adxl.readAccel(&x, &y, &z);         // Read the accelerometer values and store them in variables declared above x,y,z

  x= x*mal;
  y= y*mal;
  z=z*mal;

  Serial.write(x);
//  Serial.print(", ");
  Serial.write(y);
//  Serial.print(", ");
  Serial.write(z); 
//  Serial.println();
  
 

}

