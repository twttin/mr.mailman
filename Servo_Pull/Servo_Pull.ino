  
  
  /*
   * Automatic food delivery + OSC sensor controled
   */
  int flash ;
  
  #include <Servo.h>
  
  
  Servo pull; // create servo to pull string
  Servo block; // create servo to block tosser
  Servo drop; // create servo to drop treats
  
  void setup() {
    Serial.begin(9600);   //initiate serial communication
    pull.attach(5);       //attaches the pulling servo
    block.attach(4);       //attaches the blocking servo
    drop.attach(3);         //attaches the dropping servo
    }
  
  
  void loop() {
    //orginical position
    pull.write(95);                //stops the pulling servo
    block.write(65);               //blocking servo
    drop.write(60);               //dropping servo
    
    flash = analogRead(A1);
    Serial.println(flash) ;
    delay(100);

    //photoresistor to trigger the throw
    if (flash > 1000) {
  
    pull.write(180);                // starts pulling spoon
    delay(1500);
    pull.write(95);                // stops pulling
    delay(500);
    
    //Starting positions
    block.write(135);             //blocking the spoon
    delay(1000);
    
    pull.write(0);                // starts releasing spoon string
    delay(600);
    pull.write(95);                // stops pulling
    delay(500);

    //dispensing the food
    drop.write(180);
    delay(1500);
    drop.write(60);
    delay(1000);
    
    //release the trigger
    block.write(65);      //block in origin position
    delay(1000);
      }
    
  
    //osc message to stop pulling
  
    
    }
