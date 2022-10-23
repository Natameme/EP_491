
//Load Composition
//COMPOSITION STRUCTURE
// 3 Compositions: Isolation, Community, Overstimulation
//~lib_func.value;
(//~comp_func = {
~clock = 60/80;
~clock.postln;
~root = 261;

~pnoVol = -27.dbamp;
~gtrVol = -18.dbamp;
~orgVol = -118.dbamp;

/////////////////////////
// ISOLATION SECTION 1 //
/////////////////////////

//Phrase 1
~pnoC1S1P1 = [//1m6
		        1,   3/2,   8/5,    19/8,
				8/5, 3/2,   19/8,   3/2
		   ] * ~root;

~gtrC1S1P1A = [
	    Pseq([
	           ~root * 1, ~root * 3/2, ~root * 6/5,
	           ], 2),
	    Pseq([
	           ~root * 1, ~root * 6/5, ~root * 3/2,
	           ], 2),
		Pseq([
		       ~root * 9/8, ~root * 3/2, ~root * 6/5,
		       ], 2),
	    Pseq([
		       ~root * 9/8, ~root * 6/5, ~root * 3/2,
		       ], 2),
];

~gtrC1S1P1B = [
	           1, 3/2, 1, 3/2, 1, 3/2,
	           1, 3/2, 1, 3/2, 1, 3/2,
] * (~root/2);//1)//# of repeats

~orgC1S1P1 = [
	[3/2, 16/9] * ~root,
	[6/5, 3/2] * ~root];

~pnoC1S1P1Seq = Pbind(\oFreq, Pseq(~pnoC1S1P1, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock,
	                  \fFreq, 1000,
	                  \aDec,  2,
	                  \mVol, ~pnoVol,
                   );

~gtrC1S1P1ASeq = Pbind(\oFreq, Prand(~gtrC1S1P1A, 4),
	                   \instrument, Pif(
		            Pkey(\oFreq) >= 147.0, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  147.0, \guitarLO).asStream).asStream,
	                   \iAtk, 0.02,
	                   \fFreq, 8000,
	                   \hVol, Pwhite(3, 4, inf),
	                   //\iAtk, 0.05,
	                   \fFreq, 10000,
	                   \dur, ~clock / 3,
	                   \mVol, ~gtrVol*2,
	                   \pan, 0;
                   );

~gtrC1S1P1BSeq = Pbind(\oFreq, Pseq(~gtrC1S1P1B, 2),
	                \instrument, Pif(
		            Pkey(\oFreq) >= 147.0, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  147.0, \guitarLO).asStream).asStream,
	                   \iAtk, 0.02,
	                   \fFreq, 8000,
	                   \hVol, Pwhite(3, 4, inf),
	                   \iAtk, 0.005,
                       \dur, (~clock / 3),
	                   \mVol, ~gtrVol/2,
	                   \pan,  0;
                   );

~orgC1S1P1Seq = Pbind(\instrument, \fmSynth,
	                  \dur, ~clock * 4,
	                  \fmAmt, Pwhite(2, 5, inf),
	                  \fFreq, 1000,
	                  \aDec,  4,
	                  \oFreq, Pseq(~orgC1S1P1, 1),
	                  \mVol, ~orgVol,
                   );

//Phrase 2
~pnoC1S1P2 = [// 7 major
		        (7/8),       (7/8)*(5/3), (7/8)*(7/4),   (7/8)*(85/32),
			    (7/8)*(7/4), (7/8)*(5/3), (7/8)*(85/32), (7/8)*(5/3),
			] * ~root;//1)//# of repeats

~gtrC1S1P2A = [
	    Pseq([
	           ~root * 7/8, ~root * (7/8)*(5/4), ~root * (7/8)*(5/3),
	           ], 1),
	    Pseq([
	           ~root * 7/8, ~root * (7/8)*(5/3), ~root * (7/8)*(5/4),
	           ], 2),
		Pseq([
		       ~root * 7/8, ~root * (7/8)*(5/4), ~root * (7/8)*(3/2),
		       ], 1),
	    Pseq([
		       ~root * 7/8, ~root * (7/8)*(3/2), ~root * (7/8)*(5/4),
		       ], 1),
	    Pseq([
		       ~root * 7/8, ~root * (7/8)*(5/4), ~root * (7/8)*(16/9),
	           ], 1),
	    Pseq([
		       ~root * 7/8, ~root * (7/8)*(16/9),~root * (7/8)*(5/4),
], 1)];

~gtrC1S1P2B = [
	           7/8, (7/8)*(5/3), 7/8, (7/8)*(5/3), 7/8, (7/8)*(5/3),
	           7/8, (7/8)*(5/3), 7/8, (7/8)*(5/3), 7/8, (7/8)*(5/3),

	           7/8, (7/8)*(3/2), 7/8, (7/8)*(3/2), 7/8, (7/8)*(3/2),
               7/8, (7/8)*(3/2), 7/8, (7/8)*(3/2), 7/8, (7/8)*(3/2),
] * (~root/2);

~orgC1S1P2 = [
	[7/8, 7/8*7/4] * ~root,
	[7/8, 7/8*5/3] * ~root];

~pnoC1S1P2Seq = Pbind(\oFreq, Pseq(~pnoC1S1P2, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock,
	                  \fFreq, 1000,
	                  \aDec,  2,
	                   \mVol, ~pnoVol;
                   );

~gtrC1S1P2ASeq = Pbind(\oFreq, Pseq(~gtrC1S1P2A, 1),
	                \instrument, Pif(
		            Pkey(\oFreq) >= 147.0, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  147.0, \guitarLO).asStream).asStream,
	                   //\iAtk, 0.02,
	                   \fFreq, 8000,
	                   \hVol, Pwhite(3, 4, inf),
	                   \dur, ~clock / 3,
	                   \mVol, ~gtrVol*2,
	                   \pan, 0;
                   );

~gtrC1S1P2BSeq = Pbind(\oFreq, Pseq(~gtrC1S1P2B, 1),
	             \instrument, Pif(
		            Pkey(\oFreq) >= 147.0, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  147.0, \guitarLO).asStream).asStream,
	                   \iAtk, 0.02,
	                   \fFreq, 8000,
	                   \hVol, Pwhite(3, 4, inf),
	                   \dur, ~clock / 3,
	                   \mVol, ~gtrVol/2,
	                   \pan, 0;
                   );

~orgC1S1P2Seq = Pbind(\instrument, \fmSynth,
	                  \dur, ~clock * 4,
	                  \fmAmt, Pwhite(2, 5, inf),
	                  \aDec,  4,
	                  \oFreq, Pseq(~orgC1S1P2, 1),
	                  \mVol, ~orgVol,
                   );


//Phrase 3
~pnoC1S1P3 = [// b6 major
				(4/5), (4/5)*(15/8), (4/5)*(2), (4/5)*(3),
				(4/5)*(2), (4/5)*(15/8), (4/5)*(3), (4/5)*(15/8),
			]* ~root;//1)//# of repeats

~gtrC1S1P3A = [Pseq([
	           ~root/2 * (4/5)*(9/4), ~root/2 * (4/5)*(5/2), ~root/2 * (4/5)*(3),
	           ], 2),
		Pseq([
		       ~root/2 * (4/5)*(9/4), ~root/2 * (4/5)*(3),   ~root/2 * (4/5)*(5/2),
		       ], 2),
	    Pseq([
		       ~root/2 * (4/5)*(9/4), ~root/2 * (8/5)*(2.sqrt), ~root/2 * (4/5)*(3),
	           ], 2),
	    Pseq([
		       ~root/2 * (4/5)*(9/4), ~root/2 * (4/5)*(3), ~root/2 * (8/5)*(2.sqrt),
               ], 2)];


~gtrC1S1P3B = [
	           (4/5), (4/5)*(15/8), (4/5), (4/5)*(15/8),  (4/5), (4/5)*(15/8),
	           (4/5), (4/5)*(15/8), (4/5), (4/5)*(15/8),  (4/5), (4/5)*(15/8),

	           (4/5), (4/5)*(5/3), (4/5), (4/5)*(5/3),  (4/5), (4/5)*(5/3),
	           (4/5), (4/5)*(5/3), (4/5), (4/5)*(5/3),  (4/5), (4/5)*(5/3),
] * (~root/2);

~orgC1S1P3 = [
	Pseq([[4/5*15/8, 4/5*3/2 ]*~root, [4/5*5/3, 4/5*2.sqrt]*~root], 1),
	Pseq([[4/5*9/4]*~root, [4/5*5/3, 4/5*5/3*6/5]*~root], 1),
];

~pnoC1S1P3Seq = Pbind(\oFreq, Pseq(~pnoC1S1P3, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock,
	                  \fFreq, 1000,
	                  \aDec,  2,
	                   \mVol, ~pnoVol;
                   );

~gtrC1S1P3ASeq = Pbind(\oFreq, Prand(~gtrC1S1P3A, 4),
	             \instrument, Pif(
		            Pkey(\oFreq) >= 147.0, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  147.0, \guitarLO).asStream).asStream,
	                   \hVol, Pwhite(3, 4, inf),
	                  // \iAtk, 0.02,
	                   \fFreq, 8000,
	                   \hVol, Pwhite(3, 4, inf),
	                   \dur, ~clock / 3,
	                   \mVol, ~gtrVol*2,
	                   \pan, 0;
                   );

~gtrC1S1P3BSeq = Pbind(\oFreq, Pseq(~gtrC1S1P3B, 1),
	             \instrument, Pif(
		            Pkey(\oFreq) >= 147.0, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  147.0, \guitarLO).asStream).asStream,
	                   \iAtk, 0.02,
	                   \fFreq, 8000,
	                   \hVol, Pwhite(3, 4, inf),
	                   \dur, ~clock / 3,
	                   \mVol, ~gtrVol/2,
	                   \pan, 0;
                   );

~orgC1S1P3Seq = Pbind(\instrument, \fmSynth,
	                  \dur, ~clock * 4,
	                  \fmAmt, Pwhite(2, 5, inf),
	                  \aDec,  4,
	                  \oFreq, Prand(~orgC1S1P3, 1),
	                  \mVol, ~orgVol,
                   );

		//Weights [0.333, 0.333, 0.333], Prand([2, 4, 6], inf))

/////////////////////////
// ISOLATION SECTION 2 //
/////////////////////////

//Phrase 1
~pnoC1S2P1 = [// 1m6 > 7 neutral
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

~gtrC1S2P1A = [
	 Prand([Pseq([
	           ~root * 1, ~root * 3/2, ~root * 6/5,
	           ], 2),
	    Pseq([
	           ~root * 1, ~root * 6/5, ~root * 3/2,
	           ], 2),
		Pseq([
		       ~root * 9/8, ~root * 3/2, ~root * 6/5,
		       ], 2),
	    Pseq([
		       ~root * 9/8, ~root * 6/5, ~root * 3/2,
], 2)], 4),
	Prand([Pseq([
		~root * (15/16)*(8/10), ~root * (15/16)*(8/10) * (3/2).sqrt, ~root * (15/16)*(8/10) * (3/2).sqrt * (3/2).sqrt,
	], 1),
	Pseq([
		~root * (15/16)*(8/10), ~root * (15/16)*(8/10) * (3/2).sqrt * (3/2).sqrt, ~root * (15/16)*(8/10) * (3/2).sqrt,
	], 1),
	], 8),
];

~gtrC1S2P1B = [
	Pseq([
	           1, 3/2, 1, 3/2, 1, 3/2,
	           1, 3/2, 1, 3/2, 1, 3/2,
	           1, 3/2, 1, 3/2, 1, 3/2,
	           1, 3/2, 1, 3/2, 1, 3/2,

	           15/16, 3/2, 15/16, 3/2, 15/16, 3/2,
	           15/16, 3/2, 15/16, 3/2, 15/16, 3/2,
	           15/16, 3/2, 15/16, 3/2, 15/16, 3/2,
	           15/16, 3/2, 15/16, 3/2, 15/16, 3/2,
] * (~root/2), 1),
	Pseq([
	           1, 3/2, 1, 3/2, 1, 3/2,
	           1, 3/2, 1, 3/2, 1, 3/2,
	           1, 8/5, 1, 8/5, 1, 8/5,
	           1, 3/2, 1, 3/2, 1, 3/2,

	           15/16, 3/2, 15/16, 3/2, 15/16, 3/2,
	           15/16, 3/2, 15/16, 3/2, 15/16, 3/2,
	           15/16, 4/3, 15/16, 4/3, 15/16, 4/3,
	           15/16, 4/3, 15/16, 4/3, 15/16, 4/3,
] * (~root/2), 1),

];//1)//# of repeats

~orgC1S2P1 = [[6/5,3/2] * ~root, [15/16 * 2.sqrt, 15/16 * 2.sqrt * 2.sqrt] * ~root];

~pnoC1S2P1Seq = Pbind(\oFreq, Pseq(~pnoC1S2P1, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock,
	                  \fFreq, 1000,
	                  \aDec,  2,
	                   \mVol, ~pnoVol;
                   );

~gtrC1S2P1ASeq = Pbind(\oFreq, Pseq(~gtrC1S2P1A, 1),
	             \instrument, Pif(
		            Pkey(\oFreq) >= 147.0, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  147.0, \guitarLO).asStream).asStream,
	                  // \iAtk, 0.02,
	                   \fFreq, 8000,
	                   \hVol, Pwhite(3, 4, inf),
	                   \dur, ~clock / 3,
	                   \mVol, ~gtrVol*2,
	                   \pan, 0;
                   );

~gtrC1S2P1BSeq = Pbind(\oFreq, Prand(~gtrC1S2P1B, 1),
	             \instrument, Pif(
		            Pkey(\oFreq) >= 147.0, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  147.0, \guitarLO).asStream).asStream,
	                   \iAtk, 0.02,
	                   \fFreq, 8000,
	                   \hVol, Pwhite(3, 4, inf),
	                   \dur, ~clock / 3,
	                   \mVol, ~gtrVol/2,
                   );

~orgC1S2P1Seq = Pbind(\instrument, \fmSynth,
	                  \dur, ~clock * 8,
	                  \fmAmt, Pwhite(2, 5, inf),
	                  \aDec,  8,
	                  \oFreq, Pseq(~orgC1S2P1, 1),
	                  \mVol, ~orgVol,
                   );

/////////////////////////
// ISOLATION SECTION 3 //
/////////////////////////

//Phrase 1
~pnoC1S3P1 = [//notes
			    (3/5),       (3/5)*(3/2),       (3/5)*(9/4),               (3/5)*(5/2),
				(3/5)*(9/8), (3/5)*(9/8)*(3/2), (3/5)*(9/8)*(3/2)*(25/16), (3/5)*(9/8)*(3/2)*(3/2)
					] * ~root;//1 of repeat

~gtrC1S3P1A = [
	Prand([
		Pseq([
			(3/5), (3/5)*(3/2), (3/5)*(2/1), (3/5), (3/5)*(5/2), (3/5)*(2/1)
] * (~root / 2), 1),
		Pseq([
			(3/5), (3/5)*(2/1), (3/5)*(5/2), (3/5),  (3/5)*3, (3/5)*(5/2)
] * (~root / 2), 1),
], 2),
Prand([
		Pseq([
			(3/5)*(9/8), (3/5)*(9/8)*(3/2), (3/5)*(9/8)*(12/5), (3/5), (3/5)*(5/2), (3/5)*(9/8)*(12/5)
] * (~root / 2), 1),
		Pseq([
			(3/5)*(9/8), (3/5)*(9/8)*(3/2), (3/5)*(9/8)*(12/5), (3/5)*(5/2), (3/5)*(2), (3/5)*(3/2)
] * (~root / 2), 1),
], 2)];

~pnoC1S3P1Seq = Pbind(\oFreq, Pseq(~pnoC1S3P1, 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
	 		        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock,
	                  \fFreq, 1000,
	                  \aDec,  2,
	                  \mVol, ~pnoVol;
                   );

~gtrC1S3P1ASeq = Pbind(\oFreq, Pseq(~gtrC1S3P1A, 1),
	             \instrument, Pif(
		            Pkey(\oFreq) >= 147.0, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  147.0, \guitarLO).asStream).asStream,
	                   \iAtk, 0.02,
	                   \fFreq, 8000,
	                   \hVol, Pwhite(3, 4, inf),
	                   \dur, ~clock / 3,
	                   \mVol, ~gtrVol,
	                   \pan, 0;
                   );

//)

//(
~player.reset;
~player = Routine({{
	//variable represent random selectors
	var compOne, compTwo, compTre,
	    compOneSecOne, compOneSecTwo, compOneSecTre;

	compOne = Pwrand([1, 2, 3], [10, 2, 1].normalizeSum, inf).asStream;
	"Comp One Section  ".post;
	compOne.next.postln;

	if(compOne.next == 1, {
	///////////////
	// SECTION 1 //
	///////////////

	compOneSecOne = Pwrand([1, 2, 3], [1, 1, 1].normalizeSum, inf).asStream;

	"Comp 1 Section 1 Phrase ".post;
	compOneSecOne.next.postln;

	    //Phrase 1
    	if(compOneSecOne.next == 1, {
    		compOneSecOne.postln;
		    ~pnoC1S1P1Seq.play;
			~gtrC1S1P1ASeq.play;
			~gtrC1S1P1BSeq.play;
			~orgC1S1P1Seq.play;
    		(~pnoC1S1P1.size * ~clock).wait;
    	});

	    // Phrase 2
	    if(compOneSecOne.next == 2, {
    		 compOneSecOne.postln;
		    ~pnoC1S1P2Seq.play;
			~gtrC1S1P2ASeq.play;
			~gtrC1S1P2BSeq.play;
			~orgC1S1P2Seq.play;
    		(~pnoC1S1P2.size * ~clock).wait;
    	});

	    // Phrase 3
	    if(compOneSecOne.next == 3, {
    		 compOneSecOne.postln;
		    ~pnoC1S1P3Seq.play;
			~gtrC1S1P3ASeq.play;
			~gtrC1S1P3BSeq.play;
			~orgC1S1P3Seq.play;
    		(~pnoC1S1P3.size * ~clock).wait;
    	});
	// end of Section 1
	});

	///////////////
	// SECTION 2 //
	///////////////

	if(compOne.next == 2, {

	compOneSecTwo = Pwrand([1], [1], inf).asStream;

	"Comp 1 Section 2 Phrase ".post;
	compOneSecTwo.next.postln;

	    //Phrase 1
    	if(compOneSecTwo.next == 1, {
    		 compOneSecTwo.postln;
			~pnoC1S2P1Seq.play;
			~gtrC1S2P1ASeq.play;
			~gtrC1S2P1BSeq.play;
			~orgC1S2P1Seq.play;
    		(~pnoC1S2P1.size * ~clock).wait;
    	});
		// end of Section 2
	});

    ///////////////
	// SECTION 3 //
	///////////////

		if(compOne.next == 3, {

	compOneSecTre = Pwrand([1], [1], inf).asStream;

	"Comp 1 Section 3 Phrase ".post;
	compOneSecTre.next.postln;

	    //Phrase 1
    	if(compOneSecTre.next == 1, {
    		 compOneSecTre.postln;
		    ~pnoC1S3P1Seq.play;
			~gtrC1S3P1ASeq.play;
    		(~pnoC1S3P1.size * ~clock).wait;
    	});

	});

}.loop;
}).play;
)
~mainVol = s.volume;
~mainVol.postln;
s.mute;
s.unmute;

~pnoC1S1P1Seq.play;