~compTwo = {

~guitarC2S1P1 = [
	1  ,      9/8,         15/8,        1,
	15/8,     9/8,         1,           15/8,

	1,        9/8,         5/3,         1,
	5/3,      9/8,         1,           5/3,

	5/4,      5/4*3/2,     5/4*6/5*3/2,    5/4,
	5/4*6/5*3/2, 5/4*6/5,     5/4,         5/4*6/5,

	9/8,      9/8*4/3,     9/8*5/3,     9/8,
	9/4,      9/4*5/6,     9/4*3/4,     9/4*2/3,
	] * ~root/2;

~guitarC2S1P2 = [
	1  ,         9/8,         15/8,        1,
	9/8,         15/8,        1,           9/8,

	1,           9/8,         5/3,         1,
	9/8,         5/3,         1,           9/8,

	5/4,      5/4*3/2,     5/4*6/5*3/2,    5/4,
	5/4*6/5,  5/4*6/5*3/2,    5/4,         5/4*6/5,

	9/8,      9/8*4/3,     9/8*5/3, 9/8,
	9/8*4/3,  9/8*4/3*9/8, 9/8,         9/8*4/3,
] * ~root/2;

~guitarC2S1P3 = [
	1  ,      9/8,         15/8,        1,
	15/8,     9/8,         1,           15/8,

	1,        9/8,         5/3,         1,
	5/3,      9/8,         1,           5/3,

	15/16,       15/16*6/5,   15/16*16/9,  15/16,
	15/16*6/5,   15/16*16/9,  15/16,       15/16*6/5,

	9/8,         9/8*4/3,     9/8*4/3*5/4, 9/8,
	9/8*4/3,     9/8*4/3*9/8, 9/8,         9/8*4/3,
	] * ~root/2;


~guitarC2S1P4 = [
	1  ,         9/8,         15/8,        1,
	9/8,         15/8,        1,           9/8,

	1,           9/8,         5/3,         1,
	9/8,         5/3,         1,           9/8,

	15/16,       15/16*6/5,   15/16*16/9,  15/16,
	15/16*6/5,   15/16*16/9,  15/16,       15/16*6/5,

	9/8,         9/8*5/4,     9/8*7/4,     9/8,
	9/8*5/4,     9/8*5/3,     9/8,         1*5/3,
	] * ~root/2;
//)
//(
//~gtrC2S1Seq.stop;
~gtrC2S1P1Seq = Pbind(
	\hVol, Pwhite(2, 3, inf),
	\fFreq, 20000,
	\oFreq, Prand([
			   Pseq(~guitarC2S1P1, 1),
			   Pseq(~guitarC2S1P2, 1)], 2),
	\instrument, Pif(
		Pkey(\oFreq) >= 147.0, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  147.0, \guitarLO).asStream).asStream,
	\expMin, 1,
	\expMax, 2.6,
	\dur, ~clock/3,
	\pan, Pbrown(-0.5, 0.5),
	\mVol, ~gtrVol;
);

~gtrC2S1P2Seq = Pbind(
	\hVol, Pwhite(2, 3, inf),
	\fFreq, 20000,
	\oFreq, Prand([
			   Pseq(~guitarC2S1P3, 1),
			   Pseq(~guitarC2S1P4, 1)], 2),
	\instrument, Pif(
		Pkey(\oFreq) >= 147.0, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  147.0, \guitarLO).asStream).asStream,
	\expMin, 1,
	\expMax, 2.6,
	\dur, ~clock/3,
	\pan, Pbrown(-0.5, 0.5),
	\mVol, ~gtrVol;
);



//~gtrC2S1Seq.stop;


~orgC2S1P1 = [
	[1, 3/2, 15/8, 1, 3/2, 15/8] * ~root,
	[9/8, 3/2, 15/8, 9/8, 3/2, 15/8] * ~root,
	];

~orgC2S1P2 = [
	[1, 3/2, 8/5, 6/2.5, 16/9, 1] * ~root * 5/4,
	[1, 3/2, 2, 5/2, 5/3, 1] * ~root * 9/8,
	];

~orgC2S1P1Seq = Pbind(\instrument, \fmSynth,
	                  \dur, ~clock * 16/3,
	                  \fmAmt, [~orgVolOne.asMap, ~orgVolTwo.asMap,
			                  ~orgVolTre.asMap, ~orgVolFor.asMap,
			                  ~orgVolFiv.asMap, ~orgVolSix.asMap,
	                       	] * ~fmFac.asMap,
	                  \aDec,  8,
	                  \oFreq, Pseq(~orgC2S1P1, 2),
	                  \mVol, [~orgVolOne.asMap, ~orgVolTwo.asMap,
			                  ~orgVolTre.asMap, ~orgVolFor.asMap,
			                  ~orgVolFiv.asMap, ~orgVolSix.asMap,
		                     ];
                   );

	~orgC2S1P2Seq = Pbind(\instrument,\fmSynth,
	                  \dur, ~clock * 16/3,
	                  \fmAmt, [~orgVolOne.asMap, ~orgVolTwo.asMap,
			                  ~orgVolTre.asMap, ~orgVolFor.asMap,
			                  ~orgVolFiv.asMap, ~orgVolSix.asMap,
	                       	] * ~fmFac.asMap,
	                  \aDec,  8,
	                  \oFreq, Pseq(~orgC2S1P2, 2),
	                  \mVol, [~orgVolOne.asMap, ~orgVolTwo.asMap,
			                  ~orgVolTre.asMap, ~orgVolFor.asMap,
			                  ~orgVolFiv.asMap, ~orgVolSix.asMap,
		                     ];
                   );






~sawC2S1P1A = [[1, 5/8],   [9/8, (3/5)*(9/8)], [5/4, (3/5)*(5/4)], [4/3, (5/8)*(4/3)]] * ~root * 3/2;

~sawC2S1P1SeqA = Pbind(\instrument, \fmSynth,
	\fmAmt, 5,
	\fmAtk, 2,
	\glide, 3,
	\oFreq, Pseq(~sawC2S1P1A, 1),
	\dur, ~clock*(16/3);
);

};








	