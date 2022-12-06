~isolation = {
//Phrase 1
~pnoC1S1P1A = [//1m6
		        1,   3/2,   8/5,    19/8,
				8/5, 3/2,   19/8,   3/2
	] * ~root;

~pnoC1S1P1B = [//1m6
		        1,   3/2,   8/5,    16/9, 8/5, 3/2,
	            1,   3/2,   8/5,    16/9, 8/5, 3/2,
	            1,   3/2,   8/5,    16/9, 8/5, 3/2,
	            1,   3/2,   8/5,    16/9, 8/5, 3/2
	] * ~root/2;

~gtrC1S1P1 = [
	    Pseq([ 1, 3/2, 8/5, 12/5,   8/5, 3/2, 12/5,  3/2  ] / 2 * ~root, 1),
	    Pseq([ 1, 3/2, 8/5,  3/2,  16/9, 8/5,  3/2, 12/5  ] / 2 * ~root, 1),
	    Pseq([ 1, 3/2, 8/5,  3/2,  16/9, 8/5,  3/2,  6/5  ] / 2 * ~root, 1),
];

~orgC1S1P1 = [
	[9/8, 6/5, 4/3, 3/2, 8/5, 16/9] * ~root,
	[1,   9/8, 6/5, 4/3, 3/2, 1] * ~root];

~pnoC1S1P1ASeq = Pbind(\oFreq, Pseq(~pnoC1S1P1A, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock ,
	                  \fFreq, 5000,
	                  \aDec,  2,
	                  \mVol, ~pnoVol,
                   );

~pnoC1S1P1BSeq = Pbind(\oFreq, Pseq(~pnoC1S1P1B, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock / 3,
	                  \fFreq, 5000,
	                  \aDec,  2,
	                  \mVol, ~volEnv.asMap;
                   );

~gtrC1S1P1Seq = Pbind(\oFreq, Prand(~gtrC1S1P1, 1),
	                   \instrument, Pif(
		            Pkey(\oFreq) >= 198, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  198, \guitarLO).asStream).asStream,
	                   \fFreq, 8000,
	                   \hVol, Pwhite(3, 4, inf),
	                   \aDec, 2,
	                   \expMin, 5,
	                   \expMax, 19,
	                   \fFreq, 20000,
	                   \dur, ~clock / 4,
	                   \mVol, ~volEnv.asMap,
	                   \pan, 0;
                   );


~orgC1S1P1Seq = Pbind(\instrument, \fmSynth,
	                  \dur, ~clock * 4,
	                  \fmAmt, [~orgModOne.asMap, ~orgModTwo.asMap,
			                  ~orgModTre.asMap, ~orgModFor.asMap,
			                  ~orgModFiv.asMap, ~orgModSix.asMap,
		                     ],
	                  \fFreq, 5000,
	                  \aDec,  ~clock * 4,
	                  \oFreq, Pseq(~orgC1S1P1, 1),
		              \mVol, [~orgVolOne.asMap, ~orgVolTwo.asMap,
			                  ~orgVolTre.asMap, ~orgVolFor.asMap,
			                  ~orgVolFiv.asMap, ~orgVolSix.asMap,
		                     ],
                   );

//Phrase 2
~pnoC1S1P2A = [// 7 major
		        (7/8),       (7/8)*(5/3), (7/8)*(7/4),   (7/8)*(85/32),
			    (7/8)*(7/4), (7/8)*(5/3), (7/8)*(85/32), (7/8)*(5/3),
			] * ~root;//1)//# of repeats

~pnoC1S1P2B = [//1m6
	            1,   5/3,   7/4,    2, 7/4, 5/3,
	            1,   5/3,   7/4,    2, 7/4, 5/3,
	            1,   5/3,   7/4,    2, 7/4, 5/3,
	            1,   5/3,   7/4,    2, 7/4, 5/3,
            ] * ~root/2 * (7/8);

~gtrC1S1P2 = [
	    Pseq([
	           1, 5/3, 7/4, 8/3, 7/4, 5/3,  8/3, 5/3
	           ] * ~root * 7/16, 1),
	    Pseq([
	           1, 3/2, 7/4, 5/2, 7/4, 3/2,  5/2, 3/2
	           ] * ~root * 7/16, 1),
	   ];

~orgC1S1P2 = [
	[1, 9/8, 5/4, 3/2, 5/3, 7/4] * ~root * 7/8,
	[1, 9/8, 5/4, 4/3, 3/2, 5/3] * ~root * 7/8];

~pnoC1S1P2ASeq = Pbind(\oFreq, Pseq(~pnoC1S1P2A, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock,
	                  \fFreq, 5000,
	                  \aDec,  2,
	                   \mVol, ~pnoVol;
                   );

~pnoC1S1P2BSeq = Pbind(\oFreq, Pseq(~pnoC1S1P2B, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock/3,
	                  \fFreq, 5000,
	                  \aDec,  2,
	                   \mVol, ~volEnv.asMap;
                   );

~gtrC1S1P2Seq = Pbind(\oFreq, Pwrand(~gtrC1S1P2, [3, 1].normalizeSum, 4),
	                \instrument, Pif(
		            Pkey(\oFreq) >= 198, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  198, \guitarLO).asStream).asStream,
	                   \fFreq, 8000,
	                   \hVol, Pwhite(3, 4, inf),
	                   \aDec, 2,
	                   \expMin, 5,
	                   \expMax, 19,
	                   \fFreq, 20000,
	                   \dur, ~clock / 4,
	                   \mVol, ~volEnv.asMap,
	                   \pan, 0;
                   );

~orgC1S1P2Seq = Pbind(\instrument, \fmSynth,
	                  \dur, ~clock * 4,
	                  \fmAmt, [~orgModOne.asMap, ~orgModTwo.asMap,
			                  ~orgModTre.asMap, ~orgModFor.asMap,
			                  ~orgModFiv.asMap, ~orgModSix.asMap,
		                     ],
	                  \aDec,  ~clock * 4,
	                  \oFreq, Pseq(~orgC1S1P2, 1),
	                  \mVol, [~orgVolOne.asMap, ~orgVolTwo.asMap,
			                  ~orgVolTre.asMap, ~orgVolFor.asMap,
			                  ~orgVolFiv.asMap, ~orgVolSix.asMap,
		                     ],
                   );


//Phrase 3
~pnoC1S1P3A = [// b6 major
				1, 15/8, 2, 3, 2, 15/8, 3, 15/8
			]* ~root * 4/5;//1)//# of repeats

~pnoC1S1P3B = [Pseq([// b6 major
	           1, 15/8, 2, 9/4, 2, 15/8]* ~root * 4/10, 1),
               Pseq([// b6 major
	           1, 15/8, 2, 3, 2, 15/8]* ~root * 4/10, 1),
];//1)//# of repeats

~gtrC1S1P3 = [Pseq([
	           1, 15/8, 2, 15/8, 9/4, 2, 15/8, 3/2
	           ] * ~root * 4/10, 1),
              Pseq([
	           1, 15/8, 2, 15/8, 9/4, 2, 15/8, 3
	           ] * ~root * 4/10, 1),

];


~orgC1S1P3 = [
	Pseq([
		[2.sqrt, 3/2, 5/3, 15/8, 2, 9/4] * ~root * 4/5,
		[1, 5/4, 2.sqrt, 3/2, 5/3, 15/8] * ~root * 4/5], 1),
];


~pnoC1S1P3ASeq = Pbind(\oFreq, Pseq(~pnoC1S1P3A, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock,
	                  \fFreq, 5000,
	                  \aDec,  2,
	                   \mVol, ~pnoVol;
                   );

~pnoC1S1P3BSeq = Pbind(\oFreq, Pwrand(~pnoC1S1P3B, [2, 1].normalizeSum, 4),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock / 3,
	                  \fFreq, 5000,
	                  \aDec,  2,
	                   \mVol, ~volEnv.asMap;
                   );

~gtrC1S1P3Seq = Pbind(\oFreq, Pwrand(~gtrC1S1P3, [3, 2].normalizeSum, 4),
	              \instrument, Pif(
		            Pkey(\oFreq) >= 198, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  198, \guitarLO).asStream).asStream,
	                   \fFreq, 8000,
	                   \hVol, Pwhite(3, 4, inf),
	                   \aDec, 2,
	                   \expMin, 5,
	                   \expMax, 19,
	                   \fFreq, 20000,
	                   \dur, ~clock / 4,
	                   \mVol, ~volEnv.asMap,
	                   \pan, 0;
                   );

~orgC1S1P3Seq = Pbind(\instrument, \fmSynth,
	                  \dur, ~clock * 4,
	                  \fmAmt, [~orgModOne.asMap, ~orgModTwo.asMap,
			                  ~orgModTre.asMap, ~orgModFor.asMap,
			                  ~orgModFiv.asMap, ~orgModSix.asMap,
		                     ],
	                  \aDec,  ~clock * 4,
	                  \oFreq, Prand(~orgC1S1P3, 1),
	                  \mVol, [~orgVolOne.asMap, ~orgVolTwo.asMap,
			                  ~orgVolTre.asMap, ~orgVolFor.asMap,
			                  ~orgVolFiv.asMap, ~orgVolSix.asMap,
		                     ],
                   );


/////////////////////////
// ISOLATION SECTION 2 //
/////////////////////////

//Phrase 1
~pnoC1S2P1A = [// 1m6 > 7 neutral
		        1,   3/2, 8/5,  19/8,
			    8/5, 3/2, 19/8, 3/2,
			// 7 neutral
			    (15/16),
			    (15/16) * (8/5),
			    (15/16) * (8/5) * (3/2).sqrt,
			    (15/16) * (8/5) * (3/2).sqrt * (3/2).sqrt,
		        (15/16) * (8/5) * (3/2).sqrt,
			    (15/16) * (8/5),
			    (15/16),
			    (15/16)*(3/2).sqrt,
			 ] * ~root;//1//# of repeats

~pnoC1S2P1B = [Pseq([
	           1, 3/2, 8/5, 16/9, 8/5, 3/2
	           ] * ~root/2, 1),
               Pseq([
	           1, 3/2, 8/5, 12/5, 8/5, 3/2
	           ] * ~root/2, 1),
];

~pnoC1S2P1C = [Pseq([
	            1,
	            8/5,
	            8/5 * (((3/2).sqrt).sqrt).sqrt,
	            8/5 * (3/2).sqrt * (3/2).sqrt,
	            8/5 * (((3/2).sqrt).sqrt).sqrt,
	            8/5,
	           ] * ~root/2 * 15/16, 1),
];

~gtrC1S2P1A = [Pseq([ 1, 3/2, 8/5, 12/5,   8/5, 3/2, 12/5,  3/2  ] / 2 * ~root, 1),
	           Pseq([ 1, 3/2, 8/5,  3/2,  16/9, 8/5,  3/2, 12/5  ] / 2 * ~root, 1),
	           Pseq([ 1, 3/2, 8/5,  3/2,  16/9, 8/5,  3/2,  6/5  ] / 2 * ~root, 1),
];

~gtrC1S2P1B = [Pseq([
	                  15/16,
	                  3/2,
	                  8/5,
	                 (15/16) * (8/5) * (3/2).sqrt * (3/2).sqrt,
	                  8/5,
	                  3/2,
	                 (15/16) * (8/5) * (3/2).sqrt * (3/2).sqrt,
	                  3/2  ] / 2 * ~root, 1),
	            Pseq([
	                  15/16,
	                  3/2,
	                  8/5,
	                  3/2,
	                 (15/16) * (8/5) * (3/2).sqrt,
	                  8/5,
	                  3/2,
	                 (15/16) * (8/5) * (3/2).sqrt * (3/2).sqrt ] / 2 * ~root, 1),
];


~orgC1S2P1 = [[1, 9/8, 6/5, 4/3, 3/2, 2] * ~root,
	           [(15/16),
			    (15/16) * (8/5),
			    (15/16) * (8/5) * (3/2).sqrt,
			    (15/16) * 7/4,
	            (15/16)*(3/2).sqrt, 15/16] * ~root

];

~pnoC1S2P1ASeq = Pbind(\oFreq, Pseq(~pnoC1S2P1A, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock,
	                  \fFreq, 5000,
	                  \aDec,  2,
	                   \mVol, ~pnoVol;
                   );

~pnoC1S2P1BSeq = Pbind(\oFreq, Pseq([Pwrand(~pnoC1S2P1B, [3,2].normalizeSum, 4), Prand(~pnoC1S2P1C, 4),],  1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock/3,
	                  \fFreq, 5000,
	                  \aDec,  2,
	                   \mVol, ~volEnv.asMap;
                   );

~gtrC1S2P1Seq = Pbind(\oFreq, Pseq([Pwrand(~gtrC1S2P1A,  [3, 2, 1].normalizeSum, 4),
	                                Pwrand(~gtrC1S2P1B,     [3, 2].normalizeSum, 4)], 1),
	             \instrument, Pif(
		            Pkey(\oFreq) >= 198, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  198, \guitarLO).asStream).asStream,
	                   \fFreq, 8000,
	                   \hVol, Pwhite(3, 4, inf),
	                   \aDec, 2,
	                   \expMin, 5,
	                   \expMax, 19,
	                   \fFreq, 20000,
	                   \dur, ~clock / 4,
	                   \mVol, ~volEnv.asMap,
	                   \pan, 0;
                   );

~orgC1S2P1Seq = Pbind(\instrument, \fmSynth,
	                  \dur, ~clock * 8,
	                  \fmAmt, [~orgModOne.asMap, ~orgModTwo.asMap,
			                  ~orgModTre.asMap, ~orgModFor.asMap,
			                  ~orgModFiv.asMap, ~orgModSix.asMap,
		                     ],
	                  \aDec,  ~clock * 8,
	                  \oFreq, Pseq(~orgC1S2P1, 1),
	                  \mVol, [~orgVolOne.asMap, ~orgVolTwo.asMap,
			                  ~orgVolTre.asMap, ~orgVolFor.asMap,
			                  ~orgVolFiv.asMap, ~orgVolSix.asMap,
		                     ],
                   );


//Phrase 2
~pnoC1S2P2A = [// 1m6 > 7 neutral
		        8/9,   3/2, 8/5,  19/4,
			    8/5, 3/2, 19/8, 3/2,
			// 7 neutral
			    4/5,   3/2, 8/5,  19/4,
			    8/5, 3/2, 19/8, 3/2,
			 ] * ~root;//1//# of repeats

~pnoC1S2P2B = [Pseq([
	           8/9, 3/2, 8/5, 16/9, 8/5, 3/2
	           ] * ~root/2, 1),
               Pseq([
	           8/9, 3/2, 8/5, 12/5, 8/5, 3/2
	           ] * ~root/2, 1),
];

~pnoC1S2P2C = [Pseq([
	           4/5, 3/2, 8/5, 16/9, 8/5, 3/2
	           ] * ~root/2, 1),
               Pseq([
	           4/5, 3/2, 8/5, 12/5, 8/5, 3/2
	           ] * ~root/2, 1),
];

~gtrC1S2P2A = [Pseq([ 1, 5/3, 16/9,   3, 16/9, 5/3,   3,  5/3  ] / 2 * ~root * 8/9, 1),
	           Pseq([ 1, 5/3, 16/9, 8/3, 16/9, 5/3, 8/3,  5/3  ] / 2 * ~root * 8/9, 1),
];

~gtrC1S2P2B = [Pseq([ 8/9, 5/3, 16/9,   8/3, 16/9, 5/3,   8/3,  5/3  ] / 2 * ~root * 8/9, 1),
	           Pseq([ 8/9, 3/2, 16/9,   8/3, 16/9, 5/3,   8/3,  5/3  ] / 2 * ~root * 8/9, 1),
];


~orgC1S2P2 = [[1, 9/8, 5/4, 4/3 , 3/2, 2] * ~root * 8/9, [1, 9/8, 5/4, 4/3 , 3/2, 7/4]  * ~root * 8/9,
	          [1, 9/8, 5/4, 3/2 , 5/3, 2] * ~root * 4/5, [1, 9/8, 5/4, 3/2 , 5/3, 15/8] * ~root * 4/5
];

~pnoC1S2P2ASeq = Pbind(\oFreq, Pseq(~pnoC1S2P2A, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock,
	                  \fFreq, 5000,
	                  \aDec,  2,
	                   \mVol, ~pnoVol;
                   );

~pnoC1S2P2BSeq = Pbind(\oFreq, Pseq([Pwrand(~pnoC1S2P2B, [3,2].normalizeSum, 4), Prand(~pnoC1S2P2C, 4),],  1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock/3,
	                  \fFreq, 5000,
	                  \aDec,  2,
	                   \mVol, ~volEnv.asMap;
                   );

~gtrC1S2P2Seq = Pbind(\oFreq, Pseq([Pwrand(~gtrC1S2P2A,  [2, 3].normalizeSum, 4),
	                                Pwrand(~gtrC1S2P2B,  [3, 2].normalizeSum, 4)], 1),
	             \instrument, Pif(
		            Pkey(\oFreq) >= 198, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  198, \guitarLO).asStream).asStream,
	                   \fFreq, 8000,
	                   \hVol, Pwhite(3, 4, inf),
	                   \aDec, 2,
	                   \expMin, 5,
	                   \expMax, 19,
	                   \fFreq, 20000,
	                   \dur, ~clock / 4,
	                   \mVol, ~volEnv.asMap,
	                   \pan, 0;
                   );

~orgC1S2P2Seq = Pbind(\instrument, \fmSynth,
	                  \dur, ~clock * 4,
	                  \fmAmt, [~orgModOne.asMap, ~orgModTwo.asMap,
			                  ~orgModTre.asMap, ~orgModFor.asMap,
			                  ~orgModFiv.asMap, ~orgModSix.asMap,
		                     ],
	                  \aDec,  ~clock * 8,
	                  \oFreq, Pseq(~orgC1S2P2, 1),
	                  \mVol, [~orgVolOne.asMap, ~orgVolTwo.asMap,
			                  ~orgVolTre.asMap, ~orgVolFor.asMap,
			                  ~orgVolFiv.asMap, ~orgVolSix.asMap,
		                     ],
                   );


/////////////////////////
// ISOLATION SECTION 3 //
/////////////////////////

//Phrase 1
~pnoC1S3P1A = [//notes
			    (3/5),       (3/5)*(3/2),       (3/5)*(9/4),               (3/5)*(5/2),
				(3/5)*(9/8), (3/5)*(9/8)*(3/2), (3/5)*(9/8)*(3/2)*(25/16), (3/5)*(9/8)*(3/2)*(3/2)
					] * ~root;//1 of repeat

~pnoC1S3P1B= [//b3maj
		        3/5,   3/2,   8/5,    19/8,
				8/5, 3/2,   19/8,   3/2
	] * ~root;

~pnoC1S3P1C = [//b3maj
		        3/5,   3/2,   8/5,    16/9, 8/5, 3/2,
	            3/5,   3/2,   8/5,    16/9, 8/5, 3/2,
	            8/9,   3/2,   8/5,    16/9, 8/5, 3/2,
	            8/9,   3/2,   8/5,    16/9, 8/5, 3/2
	] * ~root/2;

~gtrC1S3P1A = [
	Pseq([1/2, 5/4, 4/3,   2, 4/3, 5/4,   2, 5/4] * ~root * 3/5, 1),
	Pseq([1/2, 5/4, 4/3, 5/4, 3/2, 4/3, 5/4, 2] * ~root * 3/5, 1),
];

~gtrC1S3P1B = [
	Pseq([9/16, 5/4, 4/3, 9/4, 4/3, 5/4, 9/4, 5/4] * ~root * 3/5, 1),
	Pseq([9/16, 5/4, 4/3, 5/4, 3/2, 4/3, 5/4, 2] * ~root * 3/5, 1),
];

~orgC1S3P1 = [[1, 3/2, 9/4, 5/2, 10/3, 15/4] * ~root * 3/5, [1, 3/2, 9/8, 6/5, 8/3, 3]  * ~root * 2/3,
];

~pnoC1S3P1ASeq = Pbind(\oFreq, Pseq(~pnoC1S3P1A, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
	 		         Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock,
	                  \fFreq, 5000,
	                  \aDec,  2,
	                  \mVol, ~pnoVol;
                   );

~pnoC1S3P1BSeq = Pbind(\oFreq, Pwrand(~pnoC1S3P1B, [0.5,0.5], 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
	 		        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock,
	                  \fFreq, 5000,
	                  \aDec,  2,
	                  \mVol, ~pnoVol;
                   );

~pnoC1S3P1CSeq = Pbind(\oFreq, Pseq(~pnoC1S3P1C, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
	 		        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock/3,
	                  \fFreq, 5000,
	                  \aDec,  2,
	                  \mVol, ~volEnv.asMap;
                   );


~gtrC1S3P1Seq = Pbind(\oFreq, Pseq([Pwrand(~gtrC1S3P1A, [3,2].normalizeSum, 2),
	                                Pwrand(~gtrC1S3P1B, [3,2].normalizeSum, 2)], 1),
		             \instrument, Pif(
		            Pkey(\oFreq) >= 198, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  198, \guitarLO).asStream).asStream,
	                   \fFreq, 8000,
	                   \hVol, Pwhite(3, 4, inf),
	                   \aDec, 2,
	                   \expMin, 5,
	                   \expMax, 19,
	                   \fFreq, 20000,
	                   \dur, ~clock / 4,
	                   \mVol, ~volEnv.asMap,
	                   \pan, 0;
                   );


~orgC1S3P1Seq = Pbind(\instrument, \fmSynth,
	                  \dur, ~clock * 4,
	                  \fmAmt, [~orgModOne.asMap, ~orgModTwo.asMap,
			                  ~orgModTre.asMap, ~orgModFor.asMap,
			                  ~orgModFiv.asMap, ~orgModSix.asMap,
		                     ],
	                  \aDec,  ~clock * 8,
	                  \oFreq, Pseq(~orgC1S3P1, 1),
	                  \mVol, [~orgVolOne.asMap, ~orgVolTwo.asMap,
			                  ~orgVolTre.asMap, ~orgVolFor.asMap,
			                  ~orgVolFiv.asMap, ~orgVolSix.asMap,
		                     ],
                   );

};