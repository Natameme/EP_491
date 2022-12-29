# BEING IN THE WAY
## a music and art installation by Natalie Hogue

### [Video Documentation](https://youtu.be/C0bO8Ad-irI)



### Program Structure:

All of the necessary files for Being in the Way are enclosed in /main. In order to run BITW, open /main/boot.sc in SuperCollider and Execute the code enclosed in the parentheses. 

### Arduino Sensors
In order for BITW to run properly, sensors must be connected to an arduino compatible microcontroller in the following configuration

Ultrasonic Sensor 1
Echo Pin One to D2
Trigger Pin One to D3 

Ultrasonic Sensor 2
Echo Pin One to D4
Trigger Pin One to D5 


Ultrasonic Sensor 3
Echo Pin One to D6
Trigger Pin One to D7 


Ultrasonic Sensor 4
Echo Pin One to D8
Trigger Pin One to D9 


Ultrasonic Sensor 5
Echo Pin One to D10
Trigger Pin One to D11

Ultrasonic Sensor 6
Echo Pin One to D12
Trigger Pin One to D13

SCD40 CO2, Temperature, Humidity Sensor to I2C SCD/SCA inputs

Theremin Antenna to A0

changes must be made in /main/bin/serialReader.scd to set the program to read from a specified Serial Address, this can be found in the Arduino IDE by copying the port of your microcontroller, or using the command ```Serial.ListDevices``` in SuperCollider

### SPEAR Reader

SPEAR Reader is a script developed to translate from the Partials output of Michael Klingbeil's SPEAR project to an array of Frequencies, amplitudes and durations. SPEAR reader is presently designed to model decaying sound objects, and does not account for dynamic spectra. Further development is required to implement this feature.

### Synths

All of the Synths (enclosed in /main/Synths/SynthLibrary.scd) were created using the SPEAR reader script. The Piano, Guitar and Flue Organ models are based on an additive/modal process, and the FM and Scream Synths utilize an FM process. Both are designed for use with SuperCollider's Pbind class and take a floating point frequency argument. 

### Questions

if you have any questions about the project I can be reached at mach6mix@gmail.com I am more than happy to discuss use of this project elsewhere either as a complete installation piece or in adapting components of the project to other means. However, as outlined in the license for this project, I simply require consultation and consent before any part of this project is used elsewhere.
