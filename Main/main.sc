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
~soundOut =   [  0,   1,   2,   3,   4,   5,   6,   7,   8,   9];
~volArr   =   [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5];

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

/*
//Load Virtual Sensors
~serialLib = (~path++"bin/fakeSerialReader.scd");
~serialLib.load;
~serial_func.value;
*/
1.wait;

//Load SoundMass
~soundMassLib = (~path++"bin/soundMass.scd");
~soundMassLib.load;
~soundMass.value;

1.wait;

//Load Composition
//init values
~clock = 60/((~headCount * 20) + 60);


~root = 261.0;

~orgVol = -40.dbamp;
~pnoVol = -40.dbamp;
~gtrVol = -24.dbamp;

//load score files

~compOneLib = (~path ++ "bin/compOneIsolation.scd");
~compOneLib.load;
~compOne.value;

~compTwoLib = (~path ++ "bin/compTwoCommunity.scd");
~compTwoLib.load;
~compTwo.value;

~compTreLib = (~path ++ "bin/compTreOverstim.scd");
~compTreLib.load;
~compTre.value;

1.wait;

~compLib = (~path++"bin/Composition.scd");
~compLib.load;
~comp_func.play ;

}).play;
};

