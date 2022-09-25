s.boot;

(
//Load Synths
~path = PathName(thisProcess.nowExecutingPath).parentPath;
~synthLib = (~path++"Synths/SynthLibrary.scd");
~mainLib = (~path++"main.scd");
~synthLib.load;
~lib_func.value;
)
(
//Load Prob Comp Demo
~path = PathName(thisProcess.nowExecutingPath).parentPath;
~compLib = (~path++"bin/ProbCompDemo.scd");
~compLib.load;
~comp_func.value;

)

