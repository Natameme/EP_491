//~comp_func = {
(
/////////////////////////
// ISOLATION SECTION 1 //
/////////////////////////
~headCount = 1;
~clock = 60/((~headCount * 20) + 60);


~root = 261.0;

~orgVol = -40.dbamp;
~pnoVol = -40.dbamp;
~gtrVol = -24.dbamp;

//load score files

~compOneLib = (~path ++ "bin/compOneIsolation.scd");
~compOneLib.load;
~compOne.value;

~compTwoLib = (~path ++ "bin/compTwoCommunity.scd");
~compTwoLib.load;
~compTwo.value;

~compTreLib = (~path ++ "bin/compTreOverstim.scd");
~compTreLib.load;
~compTre.value;

~player.reset;
~player = Routine({{

	//variable represent random selectors
	 var main, compOne, compTwo, compTre,
	    compOneSecOne, compOneSecTwo, compOneSecTre;

~clock = 60/((~headCount * 20) + 60);
		//reboot score files

~compOne.value;
~compTwo.value;
~compTre.value;

		main = Pwrand([1, 2, 3], [
			1,//(-1.0 * (~headCount - 1).squared + 1).clip(0, 1),
			0,//(-1.0 * (~headCount - 2).squared + 1).clip(0, 1),
			0/*(-1.0 * (~headCount - 3).squared + 1).clip(0, 1)*/].normalizeSum, inf).asStream;

	if(main.next == 1, {
		compOne = Pwrand([1, 2, 3], [
			10, 2, 1].normalizeSum, inf).asStream;
	//"Comp One Section  ".post;
	//compOne.next.postln;

	if(compOne.next == 1, {
			"Comp 1".postln;
	///////////////
	// SECTION 1 //
	///////////////

			compOneSecOne = Pwrand([1, 2, 3], [1, 1, 1].normalizeSum, inf).asStream;

	//"Comp 1 Section 1 Phrase ".post;
	//compOneSecOne.next.postln;

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

	//"Comp 1 Section 2 Phrase ".post;
	//compOneSecTwo.next.postln;

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

	//"Comp 1 Section 3 Phrase ".post;
	//compOneSecTre.next.postln;

	    //Phrase 1
    	if(compOneSecTre.next == 1, {
    		 compOneSecTre.postln;
		    ~pnoC1S3P1Seq.play;
			~gtrC1S3P1ASeq.play;
			~orgC1S3P1Seq.play;
    		(~pnoC1S3P1.size * ~clock).wait;
    	});

	});

	});

	////////////////////////////////////////////////////////////
	//COMPOSITION 2: COMMUNITY//////////////////////////////////
	////////////////////////////////////////////////////////////

	if(main.next == 2, {
		compTwo = Pwrand([1, 2], [1, 1].normalizeSum, inf).asStream;

		//Phrase 1
		if(compTwo.next == 1, {

			~gtrC2S1P1Seq.play;
			~orgC2S1P1Seq.play;
			//~sawC2S1P1SeqA.play;
			(~guitarC2S1P1.size * 2 * (~clock/3)).wait;

		});

		//Phrase 2
		if(compTwo.next == 2, {

			~gtrC2S1P2Seq.play;
			~orgC2S1P2Seq.play;
			(~guitarC2S1P1.size * 2 * (~clock/3)).wait;

		});

	});



	////////////////////////////////////////////////////////////
	//COMPOSITION 3: OVERSTIMULATION////////////////////////////
	////////////////////////////////////////////////////////////

	if(main.next == 3, {
		//compTre = Pwrand([1, 2, 3], [1, 1, 1].normalizeSum, inf).asStream;
		~pnoC3S1P1ASeq.play;
		~pnoC3S1P1BSeq.play;
		~pnoC3S1P1CSeq.play;
		~pnoC3S1P1DSeq.play;
		~gtrC3S1P1ASeq.play;
		~gtrC3S1P1BSeq.play;
		//~orgC3S1P1Seq.play;
		//~flueC3S1P1Seq.play;
		(~clock * 30).wait;
	});

}.loop;
}).play;

)
//};