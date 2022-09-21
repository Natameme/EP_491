
// ---------------------------------------------------------------- //
// Sensor Reader for Public Private Personal
// Written by Natalie Hogue with the help of some kind internet strangers who remain credited
// ---------------------------------------------------------------- //
// Arduino Ultrasoninc Sensor HC-SR04
// Re-writed by Arbi Abdul Jabbaar
// Expanded to Accomodate 4 sensors by Natalie Hogue
// Using Arduino IDE 1.8.7
// Using HC-SR04 Module, compatible with RCWL-1601 Moudle
// Tested on 17 September 2019
// Updated by Natalie Hogue on 20 September 2022
// ---------------------------------------------------------------- //
/*
 * Copyright (c) 2021, Sensirion AG
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 * * Neither the name of Sensirion AG nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
/////////////////////////////
// Packages for I2C Sensor // 
/////////////////////////////

#include <Arduino.h>
#include <SensirionI2CScd4x.h>
#include <Wire.h>

SensirionI2CScd4x scd4x;

void printUint16Hex(uint16_t value) {
    Serial.print(value < 4096 ? "0" : "");
    Serial.print(value < 256 ? "0" : "");
    Serial.print(value < 16 ? "0" : "");
    Serial.print(value, HEX);
}

void printSerialNumber(uint16_t serial0, uint16_t serial1, uint16_t serial2) {
    Serial.print("Serial: 0x");
    printUint16Hex(serial0);
    printUint16Hex(serial1);
    printUint16Hex(serial2);
    Serial.println();
}

//////////////////////
// Ultrasonic Definitions //
//////////////////////

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

//////////////////////
// Ultrasonic Setup //
//////////////////////

  pinMode(trigOne, OUTPUT); // Sets the trigOne as an OUTPUT
  pinMode(echoOne, INPUT); // Sets the echoOne as an INPUT

  pinMode(trigTwo, OUTPUT); // Sets the trigOne as an OUTPUT
  pinMode(echoTwo, INPUT); // Sets the echoOne as an INPUT

  pinMode(trigTre, OUTPUT); // Sets the trigOne as an OUTPUT
  pinMode(echoTre, INPUT); // Sets the echoOne as an INPUT

  pinMode(trigFor, OUTPUT); // Sets the trigOne as an OUTPUT
  pinMode(echoFor, INPUT); // Sets the echoOne as an INPUT


  Serial.begin(115200); // // Serial Communication is starting with 115200 of baudrate speed

  //////////////////////////////
  // I2C CO2/Temp/Humid Setup //
  //////////////////////////////

  while (!Serial) {
        delay(100);
    }

    Wire.begin();

    uint16_t error;
    char errorMessage[256];

    scd4x.begin(Wire);

    // stop potentially previously started measurement
    error = scd4x.stopPeriodicMeasurement();
    if (error) {
        Serial.print("Error trying to execute stopPeriodicMeasurement(): ");
        errorToString(error, errorMessage, 256);
        Serial.println(errorMessage);
    }

    uint16_t serial0;
    uint16_t serial1;
    uint16_t serial2;
    error = scd4x.getSerialNumber(serial0, serial1, serial2);
    if (error) {
        Serial.print("Error trying to execute getSerialNumber(): ");
        errorToString(error, errorMessage, 256);
        Serial.println(errorMessage);
    } else {
        printSerialNumber(serial0, serial1, serial2);
    }

    // Start Measurement
    error = scd4x.startPeriodicMeasurement();
    if (error) {
        Serial.print("Error trying to execute startPeriodicMeasurement(): ");
        errorToString(error, errorMessage, 256);
        Serial.println(errorMessage);
    }

    Serial.println("Waiting for first measurement... (5 sec)");
}

void I2Cloop(){
  ////////////////////////////////
  // I2C CO2/Temp/Humidity Loop //
  ////////////////////////////////

      uint16_t error;
    char errorMessage[256];

    delay(5000);

    // Read Measurement
    uint16_t co2;
    float temperature;
    float humidity;
    error = scd4x.readMeasurement(co2, temperature, humidity);
    if (error) {
        Serial.print("Error trying to execute readMeasurement(): ");
        errorToString(error, errorMessage, 256);
        Serial.println(errorMessage);
    } else if (co2 == 0) {
        Serial.println("Invalid sample detected, skipping.");
    } else {
        Serial.print("Co2:");
        Serial.print(co2);
        Serial.print("\t");
        Serial.print("Temperature:");
        Serial.print(temperature);
        Serial.print("\t");
        Serial.print("Humidity:");
        Serial.println(humidity);
    }
}

void ultraLoop(){

  ///////////////////////////
  // Utrasonic Sensor Loop //
  ///////////////////////////

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

void loop() {
ultraLoop();
I2Cloop();
}

