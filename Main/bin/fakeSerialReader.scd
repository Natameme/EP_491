//followed SuperCollider Tutorial 19 from Eli Fieldsteel, Patron Saint of SuperCollider Tutorials
~serial_func = {

// Global Variables
//~timeInt     = 0.0001; // loop wait time in seconds
~uFac = -0.02; //factor by which to scale Ultrasound values for Organ Volume
~charArray   = [ ];
~aVal        = 200;//ultrasonic 1
~bVal        = 200;//ultrasonic 2
~cVal        = 200;//ultrasonic 3
~dVal        = 200;//ultrasonic 4
~eVal        = 200;//ultrasonic 5
~fVal        = 200;//ultrasonic 6
~gVal        = 200;//SCD40 CO2
~hVal        = 200;//SCD40 Humidity
~iVal        = 200;//SCD40 Temperature
~jVal        = 200;//Theremin Antenna

~co2Count = 1.5;
~humCount = 1.5;
~temCount = 1.5;
//~headCount = (~co2Count + ~humCount + ~temCount) / 3.0;

	/////////////////////////////
	// call modules to control //
	/////////////////////////////

~scream = Synth(\scream, [\gate, 0, \mVol, 0]);

	~fmFac = Bus.control(s, 1);
	~fmSig = {arg in = 5;
		Out.kr(~fmFac, Lag.kr(in, 3));
		}.play;

	~orgVolOne = Bus.control(s, 1);
	~orgSigOne = {arg in = 0;
		Out.kr(~orgVolOne, Lag.kr(in, 3));
		}.play;

	~orgVolTwo = Bus.control(s, 1);
	~orgSigTwo = {arg in = 0;
		Out.kr(~orgVolTwo, Lag.kr(in, 3));
		}.play;

	~orgVolTre = Bus.control(s, 1);
	~orgSigTre = {arg in = 0;
		Out.kr(~orgVolTre, Lag.kr(in, 3));
		}.play;

	~orgVolFor = Bus.control(s, 1);
	~orgSigFor = {arg in = 0;
		Out.kr(~orgVolFor, Lag.kr(in, 3));
		}.play;

	~orgVolFiv = Bus.control(s, 1);
	~orgSigFiv = {arg in = 0;
		Out.kr(~orgVolFiv, Lag.kr(in, 3));
		}.play;

	~orgVolSix = Bus.control(s, 1);
	~orgSigSix = {arg in = 0;
		Out.kr(~orgVolSix, Lag.kr(in, 3));
		}.play;


~sensorTrack = Routine.new({
	var asciiArr;
	{
		//asciiArr = ~serial.read.asAscii;// read serial input
		//if(asciiArr.isDecDigit, {~charArray = ~charArray.add(asciiArr)});// add all digits to charArray

		// Ultrasonic 1
		//if(asciiArr == $a, {
			~aVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values


			if(~aVal < 150, {
			~orgSigOne.set(\in, (~aVal * ~uFac).dbamp);
				}, {~orgSigOne.set(\in, 0);
			});

			" distance 1: ".post;
			(~fmFac.getSynchronous * ~orgVolOne.getSynchronous).post;
			//~orgVolOne.getSynchronous.postln;

		//});

		// Ultrasonic 2
		//if(asciiArr == $b, {
			~bVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			" distance 2: ".post;
			//~bVal.post;
			if(~bVal < 150, {
			~orgSigTwo.set(\in, (~bVal * ~uFac).dbamp);
				}, {~orgSigTwo.set(\in, 0);
			});

			(~fmFac.getSynchronous * ~orgVolTwo.getSynchronous).post;

		//});

		// Ultrasonic 3
		//if(asciiArr == $c, {
			~cVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			" distance 3: ".post;
			//~cVal.post;
			if(~cVal < 150, {
			~orgSigTre.set(\in, (~cVal * ~uFac).dbamp);
				}, {~orgSigTre.set(\in, 0);
			});

				(~fmFac.getSynchronous * ~orgVolTre.getSynchronous).post;

		//});

		// Ultrasonic 4
		//if(asciiArr == $d, {
			~dVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			" distance 4: ".post;
			//~dVal.post;
				if(~dVal < 150, {
			~orgSigFor.set(\in, (~dVal * ~uFac).dbamp);
				}, {~orgSigFor.set(\in, 0);
			});
			(~fmFac.getSynchronous * ~orgVolFor.getSynchronous).post;

		//});

		// Ultrasonic 5
		//if(asciiArr == $e, {
			~eVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			" distance 5: ".post;
			//~eVal.post;
			if(~eVal < 150, {
			~orgSigFiv.set(\in, (~eVal * ~uFac).dbamp);
				}, {~orgSigFiv.set(\in, 0);
			});
				(~fmFac.getSynchronous * ~orgVolFiv.getSynchronous).post;
		//});

		// Ultrasonic 6
		//if(asciiArr == $f, {~fVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			" distance 6: ".post;
			//~fVal.postln;
			if(~fVal < 150, {
			~orgSigSix.set(\in, (~fVal * ~uFac).dbamp);
				}, {~orgSigSix.set(\in, 0);
			});

			(~fmFac.getSynchronous * ~orgVolSix.getSynchronous).postln;
		//});

		////////////////////////////////
		// SCD40 Environmental Sensor //
		////////////////////////////////

		// SCD40 CO2
		//if(asciiArr == $g, {~gVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			~co2Count = ~gVal / 3000.0;
			" CO2: ".post;
			~co2Count.post;

		//});

		// SCD40 Humidity
		//if(asciiArr == $h, {~hVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			~hVal = ~hVal / 100.0;
			~humCount = ~hVal / 300.0;
			//post values
			" Humidity: ".post;
			~humCount.post;

		//});

		// SCD40 Temperature
		//if(asciiArr == $i, {~iVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			~iVal = ~iVal / 100.0;
			~temCount = ~iVal / 10.0;
			//post values
			" Temperature: ".post;
			~temCount.postln;
			//~headCount = (~co2Count + ~humCount + ~temCount) / 3.0;
			"HeadCount: ".post;
			~headCount.postln;

				//
		//});

		// Theremin Antenna
		//if(asciiArr == $j, {
			//collect value
			~jVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//value conditioning
			//~jVal = 0; // convert to value between 0.0 ~ 1.0
			//~screamVol = ~jVal;
			~screamVol  = (~jVal - 0.25).clip(0, 1); //
			//" Theremin: ".post;
			//~jVal.postln;

				// set mod params
				~scream.set(\mVol, ~screamVol, \fmMult, (~jVal * 50),\fmAmt, ~jVal*40, );

				if(~jVal > 1.0,
				{
						~scream.set(\gate, 1, \aDec, 50);
				});
				if(~jVal < 1.0,
				{
						~scream.set(\gate, 0, \aDec, 0.5);
				});

		//});
	// timer
	~timeInt.wait;
	}.loop;
}).play;

};



