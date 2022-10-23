(
~path = PathName(thisProcess.nowExecutingPath).parentPath;
~mainLib = (~path ++ "/main.sc");
~mainLib.load;
s.options.numOutputBusChannels = 2;
s.boot.waitForBoot(onComplete: ~main.value, onFailure: "server boot fatal error, exited with code 1".postln);
)

~orgVol.asMap;
~orgVolA
/*
~killSensors.value;

~volArr;

~path = PathName(thisProcess.nowExecutingPath).parentPath;
*/

~mainLib.load;
~main.value;
