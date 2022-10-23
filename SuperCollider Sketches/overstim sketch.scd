(
//OVERSTIMULATION SECTION 1 //
~clock = 60/120;
~root = 261;
~pnoVol = -16.dbamp;
~gtrVol = -12.dbamp;
~orgTest = -32.dbamp;

~pnoC3S1P1A.stop;
~pnoC3S1P1A = Pbind(\oFreq, Pbrown(~root*0.5, ~root * 2, ~root/2, inf),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock * Pwhite(5/8, 10, inf),
	                  \fFreq, 10000,
	                  \aDec,  2,
	                  \pan, Pwhite(0, 1, inf),
	                  \mVol, ~pnoVol;
                   ).play;

~pnoC3S1P1B.stop;
~pnoC3S1P1B = Pbind(\oFreq, Pbrown(~root*1, ~root * 4, ~root/2, inf),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock * Pwhite(5/8, 10, inf),
	                  \fFreq, 10000,
	                  \aDec,  2,
	                  \pan, Pwhite(0, -1, inf),
	                  \mVol, ~pnoVol;
                   ).play;

~pnoC3S1P1C.stop;
~pnoC3S1P1C = Pbind(\oFreq, Pbrown(~root*2, ~root * 8, ~root/2, inf),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pwrand([~clock/4, ~clock * 64], [1, 2].normalizeSum, inf),
	                  \fFreq, 10000,
	                  \aDec,  2,
	                  \pan, Pwhite(1, -1, inf),
	                  \mVol, ~pnoVol;
                   ).play;

~pnoC3S1P1D.stop;
~pnoC3S1P1D = Pbind(\oFreq, ~root/4,
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock * Prand([~clock * 128, ~clock * 64], inf),
	                  \fFreq, 10000,
	                  \aDec,  60,
	                  \pan, 0,
	                  \mVol, ~pnoVol*4;
                   ).play;

~gtrC3S1P1ASeq.stop;
~gtrC3S1P1ASeq = Pbind(\oFreq, Prand([
	1,
	(3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt ,
	(3/2).sqrt*(3/2).sqrt*(3/2).sqrt
]*~root/4, inf),
	                   \instrument, Pif(
		            Pkey(\oFreq) >= 147.0, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  147.0, \guitarLO).asStream).asStream,
	                   \iAtk, 0.02,
	                   \fFreq, 8000,
	                   \hVol, Pwhite(3, 4, inf),
	                   //\iAtk, 0.05,
	                   \fFreq, 10000,
                       \dur, Pwrand([0.75, 0.5] * ~clock, [10, 1].normalizeSum, inf),
	                   \pan, 0.5,
                       \mVol, ~gtrVol;
                   ).play;

~gtrC3S1P1BSeq.stop;
~gtrC3S1P1BSeq = Pbind(\oFreq, Prand([
    (3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt ,
	(3/2).sqrt*(3/2).sqrt*(3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt*(3/2).sqrt*(3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt*(3/2).sqrt*(3/2).sqrt*9/8,
    ]*~root, inf),
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
	                   \pan, -0.5,
                       \mVol, ~gtrVol;
                   ).play;

~orgC3S1P1 = [
	(1),
	(3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt*(3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt*(3/2).sqrt*(3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt*(3/2).sqrt*(3/2).sqrt*(3/2).sqrt] * ~root;

~orgC3S1P1Seq.stop;
~orgC3S1P1Seq = Pbind(\instrument, \fmSynth,
	                  \dur, ~clock * 15,
	                  \fmAmt, Pwhite(2, 5, inf),
	                  \aAtk, 12,
	                  \aDec,  12,
	                  \oFreq, Pseq([~orgC3S1P1], inf),
	                  \mVol, ~orgTest;
                   ).play;

)