// ---------------------------------------------------------------- //
// Arduino Ultrasoninc Sensor HC-SR04
// Re-writed by Arbi Abdul Jabbaar
// Expanded to Accomodate 4 sensors by Natalie Hogue
// Using Arduino IDE 1.8.7
// Using HC-SR04 Module, compatible with RCWL-1601 Moudle
// Tested on 17 September 2019
// Updated by Natalie Hogue on 20 September 2022
// ---------------------------------------------------------------- //
//Pin Def for Sensor 1
#define echoOne 2
#define trigOne 3 

//Pin Def for Sensor 2
#define echoTwo 4 
#define trigTwo 5

//Pin Def for Sensor 3
#define echoTre 6
#define trigTre 7

//Pin Def for Sensor 4
#define echoFor 8
#define trigFor 9

// defines Duration variables
long durOne; // variable for the duration of sound wave travel
long durTwo; // variable for the duration of sound wave travel
long durTre; // variable for the duration of sound wave travel
long durFor; // variable for the duration of sound wave travel

int distOne; // variable for the distance measurement
int distTwo; // variable for the distance measurement
int distTre; // variable for the distance measurement
int distFor; // variable for the distance measurement

void setup() {
  pinMode(trigOne, OUTPUT); // Sets the trigOne as an OUTPUT
  pinMode(echoOne, INPUT); // Sets the echoOne as an INPUT

  pinMode(trigTwo, OUTPUT); // Sets the trigOne as an OUTPUT
  pinMode(echoTwo, INPUT); // Sets the echoOne as an INPUT

  pinMode(trigTre, OUTPUT); // Sets the trigOne as an OUTPUT
  pinMode(echoTre, INPUT); // Sets the echoOne as an INPUT

  pinMode(trigFor, OUTPUT); // Sets the trigOne as an OUTPUT
  pinMode(echoFor, INPUT); // Sets the echoOne as an INPUT


  Serial.begin(115200); // // Serial Communication is starting with 115200 of baudrate speed
  Serial.println("Ultrasonic Sensor RCWL-1601 Test"); // print some text in Serial Monitor
  Serial.println("with Arduino UNO R3");
}
void loop() {
  // Clears the trigPin condition
  digitalWrite(trigOne, LOW);
  digitalWrite(trigTwo, LOW);
  digitalWrite(trigTre, LOW);
  digitalWrite(trigFor, LOW);
    delayMicroseconds(2);
 
 //read loop for Sensor 1
  digitalWrite(trigOne, HIGH);  // Sets the trigOne HIGH (ACTIVE) for 10 microseconds
   delayMicroseconds(10);
  digitalWrite(trigOne, LOW);  // Set trigOne LOW
  durOne = pulseIn(echoOne, HIGH); // read echo

   //read loop for Sensor 2
  digitalWrite(trigTwo, HIGH);  // Sets the trigOne HIGH (ACTIVE) for 10 microseconds
   delayMicroseconds(10);
  digitalWrite(trigTwo, LOW);  // Set trigOne LOW
  durTwo = pulseIn(echoTwo, HIGH); // read echo

   //read loop for Sensor 3
  digitalWrite(trigTre, HIGH);  // Sets the trigOne HIGH (ACTIVE) for 10 microseconds
   delayMicroseconds(10);
  digitalWrite(trigTre, LOW);  // Set trigOne LOW
  durTre = pulseIn(echoTre, HIGH); // read echo

   //read loop for Sensor 4
  digitalWrite(trigFor, HIGH);  // Sets the trigOne HIGH (ACTIVE) for 10 microseconds
   delayMicroseconds(10);
  digitalWrite(trigFor, LOW);  // Set trigOne LOW
  durFor = pulseIn(echoFor, HIGH); // read echo


  // Calculating the distance
  distOne = durOne * 0.034 / 2; // Speed of sound wave divided by 2 (go and back)
  distTwo = durTwo * 0.034 / 2; // Speed of sound wave divided by 2 (go and back)
  distTre = durTre * 0.034 / 2; // Speed of sound wave divided by 2 (go and back)
  distFor = durFor * 0.034 / 2; // Speed of sound wave divided by 2 (go and back)

  // Displays the distance on the Serial Monitor
  Serial.print("Sensor 1: ");
  Serial.print(distOne);
  Serial.print(" cm");

  Serial.print(" Sensor 2: ");
  Serial.print(distTwo);
  Serial.print(" cm");

  Serial.print(" Sensor 3: ");
  Serial.print(distTre);
  Serial.print(" cm");

  Serial.print(" Sensor 4: ");
  Serial.print(distFor);
  Serial.println(" cm");
}

