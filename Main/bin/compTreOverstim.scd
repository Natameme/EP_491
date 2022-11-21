~compTre = {
//OVERSTIMULATION SECTION 1 //
~root = 261;
~pnoVol = -16.dbamp;
~gtrVol = -12.dbamp;
~orgTest = -32.dbamp;
~flueVol = -24.dbamp;




~pnoC3S1P1ASeq.stop;
~pnoC3S1P1ASeq = Pbind(\oFreq, Pbrown(~root*0.5, ~root * 2, ~root/2, 7.5),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock * Prand(Array.rand(15, 5, 10).normalizeSum * 60, 7.5),
	                  \fFreq, 10000,
	                  \aDec,  2,
	                  \pan, Pwhite(0, 1, inf),
	                  \mVol, ~pnoVol;
                   );

~pnoC3S1P1BSeq.stop;
~pnoC3S1P1BSeq = Pbind(\oFreq, Pbrown(~root*1, ~root * 4, ~root/2, 7.5),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, ~clock * Prand(Array.rand(15, 5, 10).normalizeSum * 60, 7.5),
	                  \fFreq, 10000,
	                  \aDec,  2,
	                  \pan, Pwhite(0, -1, inf),
	                  \mVol, ~pnoVol;
                   );


~pnoC3S1P1CSeq.stop;

~pnoC3S1P1CSeq = Pbind(\oFreq, Pbrown(~root*2, ~root * 8, ~root/2, 15),
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, inf),
	                  \dur, Pwrand([~clock*5, ~clock * 10], [2, 1].normalizeSum, 4),
	                  \fFreq, 10000,
	                  \aDec,  2,
	                  \pan, Pwhite(1, -1, inf),
	                  \mVol, ~pnoVol;
                   );

~pnoC3S1P1DSeq.stop;
~pnoC3S1P1DSeq = Pbind(\oFreq, ~root/4,
	                  \instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,
	                  \hVol, Pwhite(4, 5, 1),
	                  \dur, ~clock * 30,
	                  \fFreq, 10000,
	                  \aDec,  60,
	                  \pan, 0,
	                  \mVol, ~pnoVol*4;
                   );

~gtrC3S1P1ASeq.stop;
~gtrC3S1P1ASeq = Pbind(\oFreq, Prand([
	                   1,
	                   (3/2).sqrt,
	                   (3/2).sqrt*(3/2).sqrt ,
	                   (3/2).sqrt*(3/2).sqrt*(3/2).sqrt
	                   ]*~root/4, 60),
	                   \instrument, Pif(
		            Pkey(\oFreq) >= 147.0, \guitarHI,
		         Pif(
			        Pkey(\oFreq) <  147.0, \guitarLO).asStream).asStream,
	                   \iAtk, 0.02,
	                   \fFreq, 8000,
	                   \hVol, Pwhite(3, 4, 60),
	                   //\iAtk, 0.05,
	                   \fFreq, 10000,
                       \dur, Pwrand([0.75 * ~clock, 0.5* ~clock], [10, 1].normalizeSum, 42),
	                   \pan, 0,
                       \mVol, ~gtrVol;
                   );

~gtrC3S1P1BSeq.stop;
~gtrC3S1P1BSeq = Pbind(\oFreq, Prand([
    (3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt*(3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt*(3/2).sqrt*(3/2).sqrt,
	(3/2).sqrt*(3/2).sqrt*(3/2).sqrt*(3/2).sqrt*9/8,
    ]*~root, 120),
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
                   );

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
	                  \fmAmt, [~orgVolOne.asMap, ~orgVolTwo.asMap,
			                  ~orgVolTre.asMap, ~orgVolFor.asMap,
			                  ~orgVolFiv.asMap, ~orgVolSix.asMap,
	                       	] * ~fmFac.asMap,
	                  \aAtk, 12,
	                  \aDec,  12,
	                  \oFreq, Pseq([~orgC3S1P1], 1),
	                  \mVol, [~orgVolOne.asMap, ~orgVolTwo.asMap,
			                  ~orgVolTre.asMap, ~orgVolFor.asMap,
			                  ~orgVolFiv.asMap, ~orgVolSix.asMap,
		                     ];
                   );

~flueC3S1P1Seq.stop;
~flueC3S1P1Seq = Pbind(\instrument, \flue,
	                  \dur, ~clock * 15,
	                  \fmAmt, Pwhite(2, 5, inf),
	                  \aAtk, 15,
	                  \aDec,  15,
	                  \oFreq, 1/8 * ~root,
	                  \mVol, Pwhite(~flueVol/2, ~flueVol, 1);
                   );


};