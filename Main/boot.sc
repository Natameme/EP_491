(
~path = PathName(thisProcess.nowExecutingPath).parentPath;
~mainLib = (~path ++ "/main.sc");
~mainLib.load;
s.options.numOutputBusChannels = 16;
s.options.memSize = 8192 * 16;
s.boot.waitForBoot(onComplete: ~main.value, onFailure: "server boot fatal error, exited with code 1".postln);
s.meter;
)
SerialPort.listDevices