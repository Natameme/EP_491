
(
SynthDef(\scream,{
		arg out=0, oFreq=100, fmMult = 10, aAmt=0.3, fmAmt=1, aAtk= 0.4, aDec=10, fmAtk = 0.1, fmDec = 0.2, pan=0, mVol = 1.0, gate=1;
		var osc, ampEnv, fmEnv, sig;
		osc = SinOsc.ar(oFreq, SinOsc.ar((oFreq * fmMult), 0, fmAmt), mul: 1);
		ampEnv = EnvGen.kr(Env.new([0,aAmt,0], [aAtk,aDec]), gate, doneAction: 1);
		fmEnv = EnvGen.kr(Env.new([0,1,0], fmAtk, fmDec), gate);
		sig = Out.ar(out, Pan2.ar((osc * ampEnv) * mVol, pan));
	}).add;
)

(
~scream = Bus.control(s, 1);
{Out.kr(~scream, MouseX.kr(0, 1))}.play;

c = Synth(\scream, [\mVol, ~scream.asMap, \gate, 0]);

x = Task({ { if (~scream.getSynchronous.asFloat > 0.2,
	{c.setn(\gate, 1)}, {/*do nothing*/}); 1.wait;}.loop});

x.start;

if(~scream.getSynchronous.asFloat > 0.2,
		{Synth(\scream, [\mVol, ~scream.asMap])} //if yes
);
)



~scream.getSynchronous.asFloat > 0.2;


(~scream.getSynchronous.asFloat > 0.2).postln;
(
    {
	if( MouseX.kr(0, 1) , SinOsc.ar, Saw.ar )
    }.play
)


