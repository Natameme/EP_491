
(
SynthDef(\scream,{
		arg out=0, oFreq=100, fmMult = 10, aAmt=0.3, fmAmt=1, aAtk= 0.4, aDec=60, fmAtk = 0.1, fmDec = 0.2, pan=0, mVol = 1.0, gate=1;
		var osc, ampEnv, fmEnv, sig;
	osc = SinOsc.ar(oFreq, SinOsc.ar((oFreq * fmMult.lag(~timeInt*10)), 0, fmAmt), mul: 1);
		//ampEnv = EnvGen.kr(Env.new([0,aAmt,0], [aAtk,aDec]), gate, doneAction: 0);
		fmEnv = EnvGen.kr(Env.new([0,1,0], fmAtk, fmDec), gate);
	sig = Out.ar(out, Pan2.ar((osc  /*ampEnv*/) * mVol.lag(~timeInt), pan));
	}).add;
)




SerialPort.listDevices;
// followed SuperCollider Tutorial 19 from Eli Fieldsteel, Patron Saint of SuperCollider Tutorials
(
~timeInt = 0.02;
~synth = Synth(\scream, [\gate, 1]);
~theremin = SerialPort.new("/dev/tty.usbserial-028603DA", 115200);
~charArray = [ ];
~therTrack = Routine.new({
	var ascii;
	{
		ascii = ~theremin.read.asAscii;
		if(ascii.isDecDigit, {~charArray = 	~charArray.add(ascii)});
		if(ascii == $j, {
			~therVal = ~charArray.collect(_.digit).convertDigits;
			~therVal = ~therVal;
			~vol = ~therVal - 0.25;
			~charArray = [ ];
			~therVal.postln;
			~synth.set(\mVol, ~vol.clip(0, 1),\oFreq, ~therVal*500, \fmMult, 1);
			~timeInt.wait;
		});
	}.loop;
}).play;

)




~therTrack.stop;

(

if({~therVal > 0},
		{Synth(\scream, [\mVol, ~scream])} //if yes
);
)

