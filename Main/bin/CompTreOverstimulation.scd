~overstimulation = {
//OVERSTIMULATION SECTION 1 //

~pnoC3S1P1ASeq = Pbind(\oFreq, Pbrown(~root*0.5, ~root * 2, ~root/2, 11),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock * Pwhite(5/8, 10, 11),
	                  \fFreq, 10000,
	                  \aDec,  2,
	                  \pan, Pwhite(0, 1, inf),
	                  \mVol, ~pnoVol;
                   );


~pnoC3S1P1BSeq = Pbind(\oFreq, Pbrown(~root*1, ~root * 4, ~root/2, 11),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock * Pwhite(5/8, 10, 11),
	                  \fFreq, 10000,
	                  \aDec,  2,
	                  \pan, Pwhite(0, -1, inf),
	                  \mVol, ~pnoVol;
                   );


~pnoC3S1P1CSeq = Pbind(\oFreq, Pbrown(~root*2, ~root * 8, ~root/2, 8),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pwrand([~clock/4, ~clock * 16], [1, 2].normalizeSum, 8),
	                  \fFreq, 10000,
	                  \aDec,  2,
	                  \pan, Pwhite(1, -1, inf),
	                  \mVol, ~pnoVol;
                   );


~pnoC3S1P1DSeq = Pbind(\oFreq, Pseq([~root/4], 1),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock * 64,
	                  \fFreq, 10000,
	                  \aDec,  60,
	                  \pan, 0,
	                  \mVol, ~pnoVol;
                   );


~gtrC3S1P1ASeq = Pbind(\oFreq, Prand([
	1,
	(3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt ,
	(3/2).sqrt*(3/2).sqrt*(3/2).sqrt
	]*~root/4, 89),
	                   \instrument, Pif(
		            Pkey(\oFreq) >= 147.0, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  147.0, \guitarLO).asStream).asStream,
	                   \iAtk, 0.02,
	                   \fFreq, 8000,
	                   \hVol, Pwhite(3, 4, inf),
	                   //\iAtk, 0.05,
	                   \fFreq, 10000,
	                   \expMin, 1,
	                   \expMax, 5,
	\aDec, 3,
                       \dur, Pwrand([0.75, 0.5] * ~clock, [10, 1].normalizeSum, 89),
	                   \pan, 0,
                       \mVol, ~gtrVol*4;
                   );

~gtrC3S1P1BSeq = Pbind(\oFreq, Prand([
    (3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt ,
	(3/2).sqrt*(3/2).sqrt*(3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt*(3/2).sqrt*(3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt*(3/2).sqrt*(3/2).sqrt*9/8,
    ]*~root, 256),
	                   \instrument, Pif(
		            Pkey(\oFreq) >= 147.0, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  147.0, \guitarLO).asStream).asStream,
	                   \iAtk, 0.02,
	                   \fFreq, 8000,
	                   \hVol, Pwhite(2, 7, inf),
	                   //\iAtk, 0.05,
	                   \fFreq, 10000,
	                   \dur, ~clock/4,
	                   \pan, 0,
                       \mVol, ~gtrVol*8;
                   );

~orgC3S1P1 = [
	(1),
	(3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt*(3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt*(3/2).sqrt*(3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt*(3/2).sqrt*(3/2).sqrt*(3/2).sqrt] * ~root;


~orgC3S1P1Seq = Pbind(\instrument, \fmSynth,
	                  \dur, ~clock * 15,
	                  \fmAmt, Pwhite(5, 10, inf),
	                  \aAtk, 12,
	                  \aDec,  12,
	                  \oFreq, Pseq([~orgC3S1P1], 1),
	                  \mVol, [~orgVolOne.asMap, ~orgVolTwo.asMap,
			                  ~orgVolTre.asMap, ~orgVolFor.asMap,
			                  ~orgVolFiv.asMap, ~orgVolSix.asMap,
		                     ];
                   );


~flueC3S1P1Seq = Pbind(\instrument, \flue,
	                  \dur, ~clock * 64,
	                  \fmAmt, Pwhite(2, 5, 1),
	                  \aAtk, 15,
	                  \aDec,  15,
	                  \oFreq, Pseq([1/8 * ~root] , 1),
	                  \mVol, ~flueVol,
                   );


};