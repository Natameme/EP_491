(
s.boot;
)
(
~timeInt = 0.001;

//Load Synths
~path = PathName(thisProcess.nowExecutingPath).parentPath;
~synthLib = (~path++"Synths/SynthLibrary.scd");
~mainLib = (~path++"main.scd");
~synthLib.load;
~lib_func.value;
)
(
//Load Sensors
~path = PathName(thisProcess.nowExecutingPath).parentPath;
~serialLib = (~path++"bin/serialReader.scd");
~serialLib.load;
~serial_func.value;
)
(
//Load Prob Comp Demo
~path = PathName(thisProcess.nowExecutingPath).parentPath;
~compLib = (~path++"bin/ProbCompDemo.scd");
~compLib.load;
~comp_func.value;
)


//kill sensors
~sensorTrack.stop;

~timeInt = 0.0001;