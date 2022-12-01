//Load Composition
//COMPOSITION STRUCTURE
// 3 Compositions: Isolation, Community, Overstimulation
//~lib_func.value;

~comp_func = {
~clock = 60/60;
~clock.postln;
~root = 247;

~pnoVol = -36.dbamp;
~gtrVol = -12.dbamp;

~volEnv = Bus.control(s, 1);
	~volSig = {arg inOne = 0, inTwo = 0, inTre = 0, inFor = 0, inFiv = 0, inSix = 0;
		Out.kr(~volEnv, Lag.kr(((inOne + inTwo + inTre + inFor + inFiv + inSix)), 600));
		}.play;


~compOne = (~path++"bin/CompOneIsolation.scd");
~compOne.load;
~isolation.value;

~compTwo = (~path++"bin/CompTwoCommunity.scd");
~compTwo.load;
~community.value;

~compTre = (~path++"bin/CompTreOverstimulation.scd");
~compTre.load;
~overstimulation.value;

~player.reset;
~player = Routine({{
	//variable represent random selectors
	var main,
		compOne,       compTwo,       compTre,
	    compOneSecOne, compOneSecTwo, compOneSecTre,
		compTwoSecOne, compTwoSecTwo, compTwoSecTre;

		main = Pwrand([1, 2, 3], [0, 1, 0], inf).asStream;
		"main: ".post;
		main.next.postln;

	if(main.next == 1, {

	compOne = Pwrand([1, 2, 3], [1, 0, 0].normalizeSum, inf).asStream;
	"Comp One Section  ".post;
	compOne.next.postln;

	if(compOne.next == 1, {

	///////////////
	// SECTION 1 //
	///////////////

	compOneSecOne = Pwrand([1, 2, 3], [1, 0, 0].normalizeSum, inf).asStream;

	"Comp 1 Section 1 Phrase ".post;
	compOneSecOne.next.postln;

	    //Phrase 1
    	if(compOneSecOne.next == 1, {
    		compOneSecOne.postln;
		    ~pnoC1S1P1ASeq.play;
			~pnoC1S1P1BSeq.play;
			~gtrC1S1P1Seq.play;
			~orgC1S1P1Seq.play;
    		(~pnoC1S1P1A.size * ~clock).wait;
			~clock = 2.5/~headCount;
			~isolation.value;
    	});

	    // Phrase 2
	    if(compOneSecOne.next == 2, {
    		 compOneSecOne.postln;
		    ~pnoC1S1P2ASeq.play;
			~pnoC1S1P2BSeq.play;
			~gtrC1S1P2Seq.play;
			~orgC1S1P2Seq.play;
    		(~pnoC1S1P2A.size * ~clock).wait;
			~clock = 2.5/~headCount;
			~isolation.value;
    	});

	    // Phrase 3
	    if(compOneSecOne.next == 3, {
    		 compOneSecOne.postln;
		   ~pnoC1S1P3ASeq.play;
		   ~pnoC1S1P3BSeq.play;
		   ~gtrC1S1P3Seq.play;
		   ~orgC1S1P3Seq.play;
    		(~pnoC1S1P3A.size * ~clock).wait;
			~clock = 2.5/~headCount;
			~isolation.value;
    	});
	// end of Section 1
	});

	///////////////
	// SECTION 2 //
	///////////////

	if(compOne.next == 2, {

	compOneSecTwo = Pwrand([1, 2], [1, 1], inf).asStream;

	"Comp 1 Section 2 Phrase ".post;
	compOneSecTwo.next.postln;

	    //Phrase 1
    	if(compOneSecTwo.next == 1, {
    		 compOneSecTwo.postln;
			~pnoC1S2P1ASeq.play;
			~pnoC1S2P1BSeq.play;
			~gtrC1S2P1Seq.play;
			~orgC1S2P1Seq.play;
    		(~pnoC1S2P1A.size * ~clock).wait;
			~clock = 2.5/~headCount;
			~isolation.value;
    	});

	    //Phrase 2
    	if(compOneSecTwo.next == 2, {
    		 compOneSecTwo.postln;
			~pnoC1S2P2ASeq.play;
			~pnoC1S2P2BSeq.play;
			~gtrC1S2P2Seq.play;
			~orgC1S2P2Seq.play;
    		(~pnoC1S2P1A.size * ~clock).wait;
			~clock = 2.5/~headCount;
			~isolation.value;
    	});
		// end of Section 2
	});

    ///////////////
	// SECTION 3 //
	///////////////

		if(compOne.next == 3, {

	    //Phrase 1
    	if(compOneSecTre.next == 1, {
    		compOneSecTre.next.postln;
		   ~pnoC1S3P1ASeq.play;
		   ~pnoC1S3P1BSeq.play;
		   ~pnoC1S3P1CSeq.play;
		   ~gtrC1S3P1Seq.play;
    		(~pnoC1S3P1A.size * ~clock).wait;
			~clock = 2.5/~headCount;
			~isolation.value;
			});
// end of Isolation
		});
	});

///////////////////////
// COMP 2: COMMUNITY //
///////////////////////

	if(main.next == 2, {
			~root = 261/2;
			~pnoVol = -40.dbamp;
			compTwo = Pwrand([1, 2, 3], [10, 2, 1].normalizeSum, inf).asStream;
			"comp Two Section:".post;
			compTwo.next.post;

			if(compTwo.next == 1, {

				compTwoSecOne = Pwrand([1, 2], [1, 1].normalizeSum, inf).asStream;
				"phrase".post;
				compTwoSecOne.next.postln;

				if(compTwoSecOne.next == 1, {
					~gtrC2S1P1ASeq.play;
					~gtrC2S1P1BSeq.play;
					~pnoC2S1P1ASeq.play;
					~pnoC2S1P1BSeq.play;
					~pnoC2S1P1CSeq.play;
					~pnoC2S1P1DSeq.play;
					~orgC2S1P1Seq.play;
					(~guitarC2S1P1C.size * ~clock/8).wait;
					~clock = 3.5/2;
					~community.value;
				});

				if(compTwoSecOne.next == 2, {
					~gtrC2S1P2ASeq.play;
					~gtrC2S1P2BSeq.play;
					~pnoC2S1P2ASeq.play;
					~pnoC2S1P2BSeq.play;
					~pnoC2S1P2CSeq.play;
					~pnoC2S1P2DSeq.play;
					~orgC2S1P2Seq.play;
					(~guitarC2S2P1A.size * ~clock/8).wait;
					~clock = 3.5/2;
					~community.value;
				});
			// end of comp two section one
			});

			if(compTwo.next == 2, {
				~gtrC2S2P1ASeq.play;
				~gtrC2S2P1BSeq.play;
				~pnoC2S2P1ASeq.play;
				~pnoC2S2P1BSeq.play;
				~pnoC2S2P1CSeq.play;
				~pnoC2S2P1DSeq.play;
				~orgC2S2P1Seq.play;
				(~guitarC2S2P1A.size * ~clock/8).wait;
				~clock = 3.5/2;
				~community.value;

			});

			if(compTwo.next == 3, {

				compTwoSecTre == Pwrand([1, 2], [1, 1].normalizeSum, inf).asStream;

				if(compTwoSecTre.next == 1, {
					~gtrC2S3P1ASeq.play;
					~gtrC2S3P1BSeq.play;
					~pnoC2S3P1ASeq.play;
					~pnoC2S3P1BSeq.play;
					~pnoC2S3P1CSeq.play;
					~pnoC2S3P1DSeq.play;
					~orgC2S3P1Seq.play;
					(~guitarC2S3P1A.size * ~clock/8).wait;
					~clock = 3.5/2;
				    ~community.value;

				});

				if(compTwoSecTre.next == 2, {
					~gtrC2S3P2ASeq.play;
					~gtrC2S3P2BSeq.play;
					~pnoC2S3P2ASeq.play;
					~pnoC2S3P2BSeq.play;
					~pnoC2S3P2CSeq.play;
					~pnoC2S3P2DSeq.play;
					~orgC2S3P2Seq.play;
					(~guitarC2S3P2A.size * ~clock/8).wait;
					~clock = 3.5/2;
				    ~community.value;
				});

			});

	// end of Community
	});

		if(main.next == 3, {
			~clock = 2/3;
			~overstimulation.value;
			~pnoC3S1P1ASeq.play;
			~pnoC3S1P1BSeq.play;
			~pnoC3S1P1CSeq.play;
			~pnoC3S1P1DSeq.play;
			~gtrC3S1P1ASeq.play;
			~gtrC3S1P1BSeq.play;
			~orgC3S1P1Seq.play;
			~flueC3S1P1Seq.play;
			(~clock * 64).wait;
		// end of Overstimulation
		});
}.loop;
}).play;
};
