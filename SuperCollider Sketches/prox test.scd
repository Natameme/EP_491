(
~volEnv = Bus.control(s, 1);
~volSig = {arg inOne = 0, lag =600;
	Out.kr(~volEnv, Lag.kr(inOne, lag));
}.play;
~root = 261/2;
~clock = 1.5;
~gtrVol = -6.dbamp;
~guitarC2S1P1A = [
	1  ,      9/8,         15/8,        1,
	15/8,     9/8,         1,           15/8,

	1,        9/8,         5/3,         1,
	5/3,      9/8,         1,           5/3,

	5/4,      5/4*6/5,     5/4*6/5*3/2,    5/4,
	5/4*6/5*3/2, 5/4*6/5,     5/4,         5/4*6/5,

	9/8,      9/8*4/3,     9/8*5/3,     9/8,
	9/4,      9/4*5/6,     9/4*3/4,     9/4*2/3,
] * ~root;

~gtrC2S1P1ASeq = Pbind(
	\hVol, Pwhite(2, 3, inf),
	\fFreq, 20000,
	\oFreq, Pseq(~guitarC2S1P1A, inf),
	\instrument, Pif(
		Pkey(\oFreq) >= 164, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  164, \guitarLO).asStream).asStream,
	\aDec, 2,
	\expMin, 10,
	\expMax, 15,
	\dur, ~clock/8,
	\pan, 0,
	\mVol, ~volEnv.asMap;
).play;
)

~volSig.set(\inOne, -6.dbamp, \lag, 1800);
~volSig.set(\inOne, 0, \lag, 1);