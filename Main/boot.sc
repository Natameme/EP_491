(
~path = PathName(thisProcess.nowExecutingPath).parentPath;
~mainLib = (~path ++ "/main.sc");
~mainLib.load;
s.options.numOutputBusChannels = 2;
s.meter;
s.boot.waitForBoot(onComplete: ~main.value, onFailure: "server boot fatal error, exited with code 1".postln);
)

~volFac = 0.05;

~mainLib.load;
~main.value;

~uFac = -0.00001;

~gtrVol = -6.dbamp;
~pnoVol = -40.dbamp;
~headCount = 2;