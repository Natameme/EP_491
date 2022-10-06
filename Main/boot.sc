(
~path = PathName(thisProcess.nowExecutingPath).parentPath;
~mainLib = (~path ++ "/main.sc");
~mainLib.load;
s.boot.waitForBoot(onComplete: ~main.value, onFailure: "server boot fatal error, exited with code 1".postln);
)