~timeInt = 0.001;


//This File Executes all of the code to start the installation
//kill sensors
~killSensors = {
~sensorTrack.stop;
};

~serialPort = {
//Find Serial Port
SerialPort.listDevices;
};

~main = {

~path = PathName(thisProcess.nowExecutingPath).parentPath;
//~main = {

Routine({
	"hello world!".postln;

//global Time Sampling Interval for Control Values
~timeInt = 0.001;

//Load Synths
~synthLib = (~path++"Synths/SynthLibrary.scd");
~synthLib.load;
~lib_func.value;

2.wait;

//Load Sensors
~serialLib = (~path++"bin/serialReader.scd");
~serialLib.load;
~serial_func.value;

1.wait;

//Load SoundMass
~soundMassLib = (~path++"bin/soundMass.scd");
~soundMassLib.load;
~soundMass.value;

1.wait;


//Load Composition
~compLib = (~path++"bin/Composition.scd");
~compLib.load;
~comp_func.play ;

}).play;
};

