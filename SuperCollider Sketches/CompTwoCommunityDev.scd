(
///////////////
// SECTION 1 //
///////////////
~root = 100;
~clock = 1.5;
~gtrVol = -12.dbamp;
~pnoVol= -24.dbamp;
//phrase 1
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

~guitarC2S1P1B = [
	1  ,         9/8,         15/8,        1,
	9/8,         15/8,        1,           9/8,

	1,           9/8,         5/3,         1,
	9/8,         5/3,         1,           9/8,

	5/4,      5/4*6/5,     5/4*6/5*3/2,    5/4,
	5/4*6/5,  5/4*6/5*3/2,    5/4,         5/4*6/5,

	9/8,      9/8*4/3,     9/8*5/3, 9/8,
	9/8*4/3,  9/8*4/3*9/8, 9/8,         9/8*4/3,
] * ~root;

~guitarC2S1P1C = [
	5/3,           3/2,         15/8,        5/3,
	3/2,          15/8,          5/3,        3/2,

	5/3,           3/2,         15/8,        5/3,
	3/2,          15/8,          5/3,        3/2,

	2.sqrt,        3/2,         15/8,     2.sqrt,
	3/2,          15/8,       2.sqrt,        3/2,


	2.sqrt,        3/2,         15/8,     2.sqrt,
	3/2,          15/8,       2.sqrt,        3/2,

	5/3,           3/2,         15/8,        5/3,
	3/2,          15/8,          5/3,        3/2,

	5/3,           3/2,         15/8,        5/3,
	3/2,          15/8,          5/3,        3/2,

	2,        3/2,         15/8,     2,
	3/2,          15/8,       2,        3/2,


	15/8,        3/2,         15/8,     5/3,
	3/2,          15/8,       2.sqrt,        3/2,
] * ~root;

~pnoC2S1P1A = [3,   10/3, 15/4,  10/3,   4, 15/4, 8.sqrt,    3]*~root;
~pnoC2S1P1B = [15/8,   2,  9/4,     2, 5/2,  9/4,    5/3, 15/8]*~root;
~pnoC2S1P1C = [3/2]*~root;
~pnoC2S1P1D = [1,   1,  5/4,     9/8, 1,  1,    5/4, 9/8]*~root;

~orgC2S1P1 = [2, 3, 9/4, 5, 3, 4] * 3/4 * ~root;

~gtrC2S1P1ASeq = Pbind(
	\hVol, Pwhite(2, 3, inf),
	\fFreq, 20000,
	\oFreq,Prand([
			Pseq(~guitarC2S1P1A, 1),
			Pseq(~guitarC2S1P1B, 1)], 2),
	\instrument, Pif(
		Pkey(\oFreq) >= 164, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  164, \guitarLO).asStream).asStream,
	\aDec, 2,
	\expMin, 10,
	\expMax, 15,
	\dur, ~clock/8,
	\pan, Pbrown(-1, 0),
	\mVol, ~gtrVol*2;
);

~gtrC2S1P1BSeq = Pbind(
	\hVol, Pwhite(2, 3, inf),
	\fFreq, 20000,
	\oFreq, Pseq(~guitarC2S1P1C, 1),
	\instrument, Pif(
		Pkey(\oFreq) >= 240, \guitarHI,
		         Pif(
			 Pkey(\oFreq) <  240, \guitarLO).asStream).asStream,
	\aDec, 2,
	\expMin, 10,
	\expMax, 15,
	\dur, ~clock/8,
	\pan, Pbrown(0, 1),
	\mVol, ~gtrVol*2;
);


~pnoC2S1P1ASeq = Pbind(\oFreq, Pseq(~pnoC2S1P1A, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*7/8 , ~clock*9/8], inf),
	                  \fFreq, 4000,
	                  \aDec,  ~clock*2,
	                  \expMin, 0.3,
	                  \expmax, 4,
	                  \mVol,  ~pnoVol;
                   ).play;

~pnoC2S1P1BSeq = Pbind(\oFreq, Pseq(~pnoC2S1P1B, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC2,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*7/8 , ~clock*9/8], inf),
	                  \fFreq, 3000,
	                  \aDec,  ~clock*2,
	                  \expMin, 0.3,
	                  \expmax, 4,
	                  \mVol, ~pnoVol;
                   ).play;

~pnoC2S1P1CSeq = Pbind(\oFreq, Pseq(~pnoC2S1P1C, 4),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*2 , ~clock*2], inf),
	                  \fFreq, 5000,
	                  \aDec,  ~clock*2,
	                  \expMin, 0.01,
	                  \expMax, 4,
	                  \mVol, ~pnoVol;
                   ).play;

~pnoC2S1P1DSeq = Pbind(\oFreq, Pseq(~pnoC2S1P1D, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*7/8 , ~clock*9/8], inf),
	                  \fFreq, 5000,
	                  \expMin, 0.01,
	                  \expMax, 4,
	                  \aDec, ~clock*2,
	                  \mVol, ~pnoVol,
                     ).play;

~orgC2S1P1Seq = Pbind(\instrument, \fmSynth,
	                  \dur, ~clock * 8,
	                  \fmAmt, [~orgModOne.asMap, ~orgModTwo.asMap,
			                   ~orgModTre.asMap, ~orgModFor.asMap,
			                   ~orgModFiv.asMap, ~orgModSix.asMap,
		                     ],
	                  \fFreq, 1000,
	                  \aDec,  18,
	                  \oFreq, Pseq([~orgC2S1P1], 1),
		              \mVol, [~orgVolOne.asMap, ~orgVolTwo.asMap,
			                  ~orgVolTre.asMap, ~orgVolFor.asMap,
			                  ~orgVolFiv.asMap, ~orgVolSix.asMap,
		                     ],
                   );
)

//phrase 2
~guitarC2S1P2A = [
	1  ,      9/8,         15/8,        1,
	15/8,     9/8,         1,           15/8,

	1,        9/8,         5/3,         1,
	5/3,      9/8,         1,           5/3,

	15/16,       15/16*6/5,   15/16*16/9,  15/16,
	15/16*6/5,   15/16*16/9,  15/16,       15/16*6/5,

	9/8,         9/8*4/3,     9/8*4/3*5/4, 9/8,
	9/8*4/3,     9/8*4/3*9/8, 9/8,         9/8*4/3,
] * ~root;


~guitarC2S1P2B = [
	1  ,         9/8,         15/8,        1,
	9/8,         15/8,        1,           9/8,

	1,           9/8,         5/3,         1,
	9/8,         5/3,         1,           9/8,

	15/16,       15/16*6/5,   15/16*16/9,  15/16,
	15/16*6/5,   15/16*16/9,  15/16,       15/16*6/5,

	9/8,         9/8*5/4,     9/8*7/4,     9/8,
	9/8*5/4,     9/8*5/3,     9/8,         1*5/3,
] * ~root;

~guitarC2S1P2C = [
	2,            15/8,          9/4,          2,
	15/8,          9/4,            2,       15/8,

	2,            15/8,          9/4,          2,
	15/8,          9/4,            2,       15/8,

	5/3,          15/8,          9/4,        5/3,
	15/8,          9/4,          5/3,       15/8,

    5/3,          15/8,          9/4,        5/3,
	15/8,          9/4,          5/3,       15/8,

	2,            15/8,          9/4,          2,
	15/8,          9/4,            2,       15/8,

	2,            15/8,          9/4,          2,
	15/8,          9/4,            2,       15/8,

	9/4,          15/8,          9/4,        9/4,
	15/8,          9/4,          9/4,       15/8,

    15/8,         15/8,          9/4,        5/3,
	15/8,          9/4,          3/2,       15/8,

] * ~root;

~pnoC2S1P2A = [3,   8.sqrt,     3,  8.sqrt,    3, 8.sqrt,     3, 10/3] * ~root;
~pnoC2S1P2B = [15/8,   5/3,  15/8,     5/3, 15/8,    5/3,  15/8,    2] * ~root;
~pnoC2S1P2C = [3/2, 2.sqrt,   3/2,     3/2,  3/2, 2.sqrt,   3/2,  5/3] * ~root;
~pnoC2S1P2D = [1,       1,  15/16,     9/8,    1,      1, 15/16,  9/8] * ~root;

~orgC2S1P2 = [4/3, 3/2, 9/4, 5/2, 3/2, 4] * 3/4 * ~root;

~gtrC2S1P2ASeq = Pbind(
	\hVol, Pwhite(2, 3, inf),
	\fFreq, 20000,
	\oFreq,Prand([
			Pseq(~guitarC2S1P2A, 1),
			Pseq(~guitarC2S1P2B, 1)], 2),
	\instrument, Pif(
		Pkey(\oFreq) >= 164, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  164, \guitarLO).asStream).asStream,
	\aDec, 2,
	\expMin, 10,
	\expMax, 15,
	\dur, ~clock/8,
	\pan, Pbrown(-1, 0),
	\mVol, ~gtrVol*2;
);

~gtrC2S1P2BSeq = Pbind(
	\hVol, Pwhite(2, 3, inf),
	\fFreq, 20000,
	\oFreq, Pseq(~guitarC2S1P2C, 1),
	\instrument, Pif(
		Pkey(\oFreq) >= 240, \guitarHI,
		         Pif(
			 Pkey(\oFreq) <  240, \guitarLO).asStream).asStream,
	\aDec, 2,
	\expMin, 10,
	\expMax, 15,
	\dur, ~clock/8,
	\pan, Pbrown(0, 1),
	\mVol, ~gtrVol*2;
);


~pnoC2S1P2ASeq = Pbind(\oFreq, Pseq(~pnoC2S1P2A, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*7/8 , ~clock*9/8], inf),
	                  \fFreq, 4000,
	                  \aDec,  ~clock*2,
	                  \expMin, 0.3,
	                  \expmax, 4,
	                  \mVol,  ~pnoVol;
                   );

~pnoC2S1P2BSeq = Pbind(\oFreq, Pseq(~pnoC2S1P2B, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC2,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*7/8 , ~clock*9/8], inf),
	                  \fFreq, 3000,
	                  \aDec,  ~clock*2,
	                  \expMin, 0.3,
	                  \expmax, 4,
	                  \mVol, ~pnoVol;
                   );

~pnoC2S1P2CSeq = Pbind(\oFreq, Pseq(~pnoC2S1P2C, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*7/8 , ~clock*9/8], inf),
	                  \fFreq, 5000,
	                  \aDec,  ~clock*2,
	                  \expMin, 0.01,
	                  \expMax, 4,
	                  \mVol, ~pnoVol;
                   );

~pnoC2S1P2DSeq = Pbind(\oFreq, Pseq(~pnoC2S1P2D, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*7/8 , ~clock*9/8], inf),
	                  \fFreq, 5000,
	                  \expMin, 0.01,
	                  \expMax, 4,
	                  \aDec, ~clock*2,
	                  \mVol, ~pnoVol,
                     );

~orgC2S1P2Seq = Pbind(\instrument, \fmSynth,
	                  \dur, ~clock * 8,
	                  \fmAmt, [~orgModOne.asMap, ~orgModTwo.asMap,
			                   ~orgModTre.asMap, ~orgModFor.asMap,
			                   ~orgModFiv.asMap, ~orgModSix.asMap,
		                     ],
	                  \fFreq, 1000,
	                  \aDec,  18,
	                  \oFreq, Pseq([~orgC2S1P2], 1),
		              \mVol, [~orgVolOne.asMap, ~orgVolTwo.asMap,
			                  ~orgVolTre.asMap, ~orgVolFor.asMap,
			                  ~orgVolFiv.asMap, ~orgVolSix.asMap,
		                     ],
                   );


///////////////
// SECTION 2 //
///////////////

//phrase 1
~guitarC2S2P1A = [
	3/4  ,       9/8,         15/8,        3/4,
	15/8,       15/8,          3/4,        9/8,

	15/8,        3/4,         15/8,       15/8,
	9/8,        15/8,         15/8,        9/8,

	1,           5/4,          5/3,        5/4,
	15/8,        5/3,            1,        5/4,

	5/3,         5/4,         15/8,        5/3,
	1,          15/8,          5/3,        5/4,

	3/4  ,       9/8,         15/8,        3/4,
	15/8,       15/8,          3/4,        9/8,

	15/8,        3/4,         15/8,       15/8,
	9/8,        15/8,         15/8,        9/8,

	1,           5/4,          5/3,        5/4,
	15/8,        5/3,            1,        5/4,

	2,         5/4,         2,        15/8,
	1,          15/8,          5/3,        5/4,
] * ~root;

~guitarC2S2P1B = [
	2,            15/8,          9/4,          2,
	15/8,          9/4,            2,       15/8,

	2,            15/8,          9/4,          2,
	15/8,          9/4,            2,       15/8,

	5/3,          15/8,          9/4,        5/3,
	15/8,          9/4,          5/3,       15/8,

    5/3,          15/8,          9/4,        5/3,
	15/8,          9/4,          5/3,       15/8,

	2,            15/8,          9/4,          2,
	15/8,          9/4,            2,       15/8,

	2,            15/8,          9/4,          2,
	15/8,          9/4,            2,       15/8,

	9/4,          15/8,          9/4,        9/4,
	15/8,          9/4,          9/4,       15/8,

    15/8,         15/8,          9/4,        5/3,
	15/8,          9/4,          3/2,       15/8,

] * ~root;

~guitarC2S2P1C = [
	5/3,           3/2,         15/8,        5/3,
	3/2,          15/8,          5/3,        3/2,

	15/8,          5/3,          3/2,       15/8,
	5/3,           3/2,          15/8,      3/2,

	5/4,           3/2,          9/4,        5/4,
	3/2,           9/4,          5/4,        3/2,

    9/4,           5/4,          3/2,        9/4,
    5/4,           3/2,          9/4,       15/8,

	5/3,           3/2,         15/8,        5/3,
	3/2,          15/8,          5/3,        3/2,

	15/8,          5/3,          3/2,       15/8,
	5/3,           3/2,         15/8,        3/2,

	5/4,           3/2,            2,        5/4,
	3/2,             2,          5/4,        3/2,

    15/8,           5/4,         3/2,        5/3,
    5/4,           15/8,          5/3,        3/2,
] * ~root;

~pnoC2S2P1A = [15/8,           5/3,     15/8,       2,    15/8,      2,     9/4,      2] * ~root;
~pnoC2S2P1B = [3/2,         2.sqrt,      3/2,     3/2,     3/2,    5/3,    15/8,    5/3] * ~root;
~pnoC2S2P1C = [9/8,            9/8,      5/4,     9/8,     9/8,    9/8,     5/4,    5/4] * ~root;
~pnoC2S2P1D = [3/4,            3/4,      1/2,     1/2,     3/4,    3/4,     1/2,    1/2] * ~root;

~orgC2S2P1 = [1, 3/2, 5/2, 3, 15/4, 4] * 3/4 * ~root;

~gtrC2S2P1ASeq = Pbind(
	\hVol, Pwhite(2, 3, inf),
	\fFreq, 20000,
	\oFreq, Pseq(~guitarC2S2P1A, 1),
	\instrument, Pseq([\guitarLO, \guitarLO, \guitarHI, \guitarLO, \guitarHI, \guitarHI,
		               \guitarLO, \guitarLO, \guitarHI, \guitarLO, \guitarHI, \guitarHI,
		               \guitarLO, \guitarHI, \guitarHI, \guitarLO], inf),
	\aDec, 2,
	\expMin, 10,
	\expMax, 15,
	\dur, ~clock/8,
	\pan, Pbrown(-1, 0),
	\mVol, ~gtrVol*2;
);


~gtrC2S2P1BSeq = Pbind(
	\hVol, Pwhite(2, 3, inf),
	\fFreq, 20000,
	\oFreq, Prand([
		Pseq(~guitarC2S2P1A, 1),
		Pseq(~guitarC2S2P1B, 1)], 1),
	\instrument, Pseq([\guitarLO, \guitarLO, \guitarHI], inf),
	\aDec, 2,
	\expMin, 10,
	\expMax, 15,
	\dur, ~clock/8,
	\pan, Pbrown(0, 1),
	\mVol, ~gtrVol*2;
);


~pnoC2S2P1ASeq = Pbind(\oFreq, Pseq(~pnoC2S2P1A, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*7/8 , ~clock*9/8], inf),
	                  \fFreq, 4000,
	                  \aDec,  ~clock*2,
	                  \expMin, 0.3,
	                  \expmax, 4,
	                  \mVol,  ~pnoVol;
                   );

~pnoC2S2P1BSeq = Pbind(\oFreq, Pseq(~pnoC2S2P1B, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC2,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*7/8 , ~clock*9/8], inf),
	                  \fFreq, 3000,
	                  \aDec,  ~clock*2,
	                  \expMin, 0.3,
	                  \expmax, 4,
	                  \mVol, ~pnoVol;
                   );

~pnoC2S2P1CSeq = Pbind(\oFreq, Pseq(~pnoC2S2P1C, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*7/8 , ~clock*9/8], inf),
	                  \fFreq, 5000,
	                  \aDec,  ~clock*2,
	                  \expMin, 0.01,
	                  \expMax, 4,
	                  \mVol, ~pnoVol;
                   );

~pnoC2S2P1DSeq = Pbind(\oFreq, Pseq(~pnoC2S2P1D, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*7/8 , ~clock*9/8], inf),
	                  \fFreq, 5000,
	                  \expMin, 0.01,
	                  \expMax, 4,
	                  \aDec, ~clock*2,
	                  \mVol, ~pnoVol,
                     );

~orgC2S2P1Seq = Pbind(\instrument, \fmSynth,
	                  \dur, ~clock * 8,
	                  \fmAmt, [~orgModOne.asMap, ~orgModTwo.asMap,
			                   ~orgModTre.asMap, ~orgModFor.asMap,
			                   ~orgModFiv.asMap, ~orgModSix.asMap,
		                     ],
	                  \fFreq, 1000,
	                  \aDec,  18,
	                  \oFreq, Pseq([~orgC2S2P1], 1),
		              \mVol, [~orgVolOne.asMap, ~orgVolTwo.asMap,
			                  ~orgVolTre.asMap, ~orgVolFor.asMap,
			                  ~orgVolFiv.asMap, ~orgVolSix.asMap,
		                     ],
                   );


///////////////
// SECTION 3 //
///////////////

//phrase 1
~guitarC2S3P1A = [
	5/6,       5/4,         2,             5/6,
	15/8,       2,          5/6,           5/4,

	2,        5/6,         15/8,             2,
	9/8,        2.sqrt,         3/2,        15/8,

	1,           5/4,          5/3,        5/4,
	15/8,        5/3,            1,        5/4,

	5/3,         5/4,         15/8,        5/3,
	9/8,         2.sqrt,       3/2,       15/8,

	5/6,       5/4,         2,             5/6,
	15/8,       2,          5/6,           5/4,

	2,        5/6,            15/8,           2,
	9/8,        2.sqrt,        3/2,        15/8,

	1,           5/4,          5/3,        5/4,
	15/8,        5/3,            1,        9/4,

	5/3,         5/4,          9/4,        5/3,
	9/8,         2.sqrt,       3/2,       15/8,
] * ~root;

~guitarC2S3P1B = [
	2,            15/8,        8.sqrt,        2,
	15/8,       8.sqrt,             2,     15/8,

	8.sqrt,        2,          15/8,       8.sqrt,
	2,           15/8,          8.sqrt,    8.sqrt,

	15/8,          15/8,           3,        15/8,
	15/8,           3,          15/8,        15/8,

    3,            15/8,         15/8,           3,
    15/8,         15/8,            3,        15/8,

	2,            15/8,         10/3,           2,
	15/8,         10/3,            2,        15/8,

	10/3,            2,         15/8,        10/3,
	2,            15/8,         10/3,        10/3,

	15/8,         15/8,         15/4,        15/8,
	15/8,         15/4,         15/8,        15/8,

    10/3,         15/8,         15/8,           3,
    15/8,         15/8,            3,        15/8,
] * ~root;

~pnoC2S3P1A = [3,           8.sqrt,     15/4,    10/3,       4,   15/4,     8.sqrt,      3] * ~root;
~pnoC2S3P1B = [15/8,           5/3,      9/4,       2,     5/4,    9/4,        5/3,   15/8] * ~root;
~pnoC2S3P1C = [5/4,            5/4,      5/4,     5/4,     5/4,    5/4,        5/4,    5/4] * ~root;
~pnoC2S3P1D = [5/6,            5/6,      1/2,     1/2,     5/6,    5/6,        1/2,    1/2] * ~root;

~orgC2S3P1 = [9/4, 5/2, 8.sqrt, 3, 10/3, 15/4] * ~root;

~gtrC2S3P1ASeq = Pbind(
	\hVol, Pwhite(2, 3, inf),
	\fFreq, 20000,
	\oFreq, Pseq(~guitarC2S3P1A, 1),
	\instrument, Pseq([\guitarLO, \guitarLO, \guitarHI, \guitarLO, \guitarHI, \guitarHI,
		               \guitarLO, \guitarLO, \guitarHI, \guitarLO, \guitarHI, \guitarHI,
		               \guitarLO, \guitarHI, \guitarHI, \guitarLO], inf),
	\aDec, 2,
	\expMin, 10,
	\expMax, 15,
	\dur, ~clock/8,
	\pan, Pbrown(-1, 0),
	\mVol, ~gtrVol*2;
);

~gtrC2S3P1BSeq = Pbind(
	\hVol, Pwhite(2, 3, inf),
	\fFreq, 20000,
	\oFreq, Pseq(~guitarC2S3P1B, 1),
	\instrument, Pseq([\guitarLO, \guitarLO, \guitarHI], inf),
	\aDec, 2,
	\expMin, 10,
	\expMax, 15,
	\dur, ~clock/8,
	\pan, Pbrown(0, 1),
	\mVol, ~gtrVol*2;
);


~pnoC2S3P1ASeq = Pbind(\oFreq, Pseq(~pnoC2S3P1A, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*7/8 , ~clock*9/8], inf),
	                  \fFreq, 4000,
	                  \aDec,  ~clock*2,
	                  \expMin, 0.3,
	                  \expmax, 4,
	                  \mVol,  ~pnoVol;
                   );

~pnoC2S3P1BSeq = Pbind(\oFreq, Pseq(~pnoC2S3P1B, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC2,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*7/8 , ~clock*9/8], inf),
	                  \fFreq, 3000,
	                  \aDec,  ~clock*2,
	                  \expMin, 0.3,
	                  \expmax, 4,
	                  \mVol, ~pnoVol;
                   );

~pnoC2S3P1CSeq = Pbind(\oFreq, Pseq(~pnoC2S3P1C, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*7/8 , ~clock*9/8], inf),
	                  \fFreq, 5000,
	                  \aDec,  ~clock*2,
	                  \expMin, 0.01,
	                  \expMax, 4,
	                  \mVol, ~pnoVol;
                   );

~pnoC2S3P1DSeq = Pbind(\oFreq, Pseq(~pnoC2S3P1D, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*7/8 , ~clock*9/8], inf),
	                  \fFreq, 5000,
	                  \expMin, 0.01,
	                  \expMax, 4,
	                  \aDec, ~clock*2,
	                  \mVol, ~pnoVol,
                     );

~orgC2S3P1Seq = Pbind(\instrument, \fmSynth,
	                  \dur, ~clock * 8,
	                  \fmAmt, [~orgModOne.asMap, ~orgModTwo.asMap,
			                   ~orgModTre.asMap, ~orgModFor.asMap,
			                   ~orgModFiv.asMap, ~orgModSix.asMap,
		                     ],
	                  \fFreq, 1000,
	                  \aDec,  18,
	                  \oFreq, Pseq([~orgC2S3P1], 1),
		              \mVol, [~orgVolOne.asMap, ~orgVolTwo.asMap,
			                  ~orgVolTre.asMap, ~orgVolFor.asMap,
			                  ~orgVolFiv.asMap, ~orgVolSix.asMap,
		                     ],
                   );

//phrase 2
~guitarC2S3P2A = [
	5/6,       5/4,         2,             5/6,
	15/8,       2,          5/6,           5/4,

	2,        5/6,         15/8,             2,
	9/8,        2.sqrt,         3/2,        15/8,

	1,           5/4,          5/3,        5/4,
	15/8,        5/3,            1,        5/4,

	5/3,         5/4,         15/8,        5/3,
	9/8,         2.sqrt,       3/2,       15/8,

	5/6,       5/4,         2,             5/6,
	15/8,       2,          5/6,           5/4,

	2,        5/6,            15/8,           2,
	9/8,        2.sqrt,        3/2,        15/8,

	1,           5/4,          5/3,        5/4,
	15/8,        5/3,            1,        9/4,

	1,           5/4,          5/3,        5/4,
	15/8,        5/3,            1,        9/4,
] * ~root;

~guitarC2S3P2B = [
	2,            15/8,        8.sqrt,        2,
	15/8,       8.sqrt,             2,     15/8,

	8.sqrt,        2,          15/8,       8.sqrt,
	2,           15/8,          8.sqrt,    8.sqrt,

	15/8,          15/8,           3,        15/8,
	15/8,           3,          15/8,        15/8,

    3,            15/8,         15/8,           3,
    15/8,         15/8,            3,        15/8,

	2,            15/8,         10/3,           2,
	15/8,         10/3,            2,        15/8,

	10/3,            2,         15/8,        10/3,
	2,            15/8,         10/3,        10/3,

	15/8,         15/8,         15/4,        15/8,
	15/8,         15/4,         15/8,        15/8,

    10/3,         15/8,         15/8,           3,
    15/8,         15/8,            3,        15/8,
] * ~root;

~pnoC2S3P2A = [3,           8.sqrt,     15/4,    10/3,       4,   15/4,     8.sqrt,      3] * ~root;
~pnoC2S3P2B = [15/8,           5/3,      9/4,       2,     5/4,    9/4,        5/3,   15/8] * ~root;
~pnoC2S3P2C = [5/4,            5/4,      5/4,     5/4,     5/4,    5/4,        5/4,    5/4] * ~root;
~pnoC2S3P2D = [5/6,            5/6,      1/2,     1/2,     5/6,    5/6,        1/2,    1/2] * ~root;

~orgC2S3P2 = [5/2, 8.sqrt, 3, 10/3, 15/4, 9/2] * ~root;

~gtrC2S3P2ASeq = Pbind(
	\hVol, Pwhite(2, 3, inf),
	\fFreq, 20000,
	\oFreq, Pseq(~guitarC2S3P2A, 1),
	\instrument, Pseq([\guitarLO, \guitarLO, \guitarHI, \guitarLO, \guitarHI, \guitarHI,
		               \guitarLO, \guitarLO, \guitarHI, \guitarLO, \guitarHI, \guitarHI,
		               \guitarLO, \guitarHI, \guitarHI, \guitarLO], inf),
	\aDec, 2,
	\expMin, 10,
	\expMax, 15,
	\dur, ~clock/8,
	\pan, Pbrown(-1, 0),
	\mVol, ~gtrVol*2;
);

~gtrC2S3P2BSeq = Pbind(
	\hVol, Pwhite(2, 3, inf),
	\fFreq, 20000,
	\oFreq, Pseq(~guitarC2S3P2B, 1),
	\instrument, Pseq([\guitarLO, \guitarLO, \guitarHI], inf),
	\aDec, 2,
	\expMin, 10,
	\expMax, 15,
	\dur, ~clock/8,
	\pan, Pbrown(0, 1),
	\mVol, ~gtrVol*2;
);


~pnoC2S3P2ASeq = Pbind(\oFreq, Pseq(~pnoC2S3P2A, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*7/8 , ~clock*9/8], inf),
	                  \fFreq, 4000,
	                  \aDec,  ~clock*2,
	                  \expMin, 0.3,
	                  \expmax, 4,
	                  \mVol,  ~pnoVol;
                   );

~pnoC2S3P2BSeq = Pbind(\oFreq, Pseq(~pnoC2S3P2B, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC2,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*7/8 , ~clock*9/8], inf),
	                  \fFreq, 3000,
	                  \aDec,  ~clock*2,
	                  \expMin, 0.3,
	                  \expmax, 4,
	                  \mVol, ~pnoVol;
                   );

~pnoC2S3P2CSeq = Pbind(\oFreq, Pseq(~pnoC2S3P2C, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*7/8 , ~clock*9/8], inf),
	                  \fFreq, 5000,
	                  \aDec,  ~clock*2,
	                  \expMin, 0.01,
	                  \expMax, 4,
	                  \mVol, ~pnoVol;
                   );

~pnoC2S3P2DSeq = Pbind(\oFreq, Pseq(~pnoC2S3P2D, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pseq([~clock*7/8 , ~clock*9/8], inf),
	                  \fFreq, 5000,
	                  \expMin, 0.01,
	                  \expMax, 4,
	                  \aDec, ~clock*2,
	                  \mVol, ~pnoVol,
                     );

~orgC2S3P2Seq = Pbind(\instrument, \fmSynth,
	                  \dur, ~clock * 8,
	                  \fmAmt, [~orgModOne.asMap, ~orgModTwo.asMap,
			                   ~orgModTre.asMap, ~orgModFor.asMap,
			                   ~orgModFiv.asMap, ~orgModSix.asMap,
		                     ],
	                  \fFreq, 1000,
	                  \aDec,  18,
	                  \oFreq, Pseq([~orgC2S3P2], 1),
		              \mVol, [~orgVolOne.asMap, ~orgVolTwo.asMap,
			                  ~orgVolTre.asMap, ~orgVolFor.asMap,
			                  ~orgVolFiv.asMap, ~orgVolSix.asMap,
		                     ],
                   );

