//followed SuperCollider Tutorial 19 from Eli Fieldsteel, Patron Saint of SuperCollider Tutorials
~serial_func = {

~serial    = SerialPort.new("/dev/tty.usbserial-026019A3", 115200);

// Global Variables
//~timeInt     = 0.0001; // loop wait time in seconds
~charArray   = [ ];
~aVal        = 0;//ultrasonic 1
~bVal        = 0;//ultrasonic 2
~cVal        = 0;//ultrasonic 3
~dVal        = 0;//ultrasonic 4
~eVal        = 0;//ultrasonic 5
~fVal        = 0;//ultrasonic 6
~gVal        = 0;//SCD40 CO2
~hVal        = 0;//SCD40 Humidity
~iVal        = 0;//SCD40 Temperature
~jVal        = 0;//Theremin Antenna

~volFac= 0.8;
~fmFac = 20;
~uFac = -0.1;
~co2Count = 1.5;
~humCount = 1.5;
~temCount = 1.5;
~isolCount = 0;
~commCount = 0;
~stimCount = 0;
~headCount =(~co2Count + ~humCount + ~temCount) / 3.0;

	/////////////////////////////
	// call modules to control //
	/////////////////////////////

~scream = Synth(\scream, [\gate, 0, \mVol, 0]);
//VOLUME BUSSES
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

//MODULATION BUSSES
	~orgModOne = Bus.control(s, 1);
	~orgMSigOne = {arg in = 0;
		Out.kr(~orgModOne, Lag.kr(in, 5));
		}.play;

	~orgModTwo = Bus.control(s, 1);
	~orgMSigTwo = {arg in = 0;
		Out.kr(~orgModTwo, Lag.kr(in, 5));
		}.play;

	~orgModTre = Bus.control(s, 1);
	~orgMSigTre = {arg in = 0;
		Out.kr(~orgModTre, Lag.kr(in, 5));
		}.play;

	~orgModFor = Bus.control(s, 1);
	~orgMSigFor = {arg in = 0;
		Out.kr(~orgModFor, Lag.kr(in, 5));
		}.play;

	~orgModFiv = Bus.control(s, 1);
	~orgMSigFiv = {arg in = 0;
		Out.kr(~orgModFiv, Lag.kr(in, 5));
		}.play;

	~orgModSix = Bus.control(s, 1);
	~orgMSigSix = {arg in = 0;
		Out.kr(~orgModSix, Lag.kr(in, 5));
		}.play;

~sensorTrack = Routine.new({
	var asciiArr;
	{
		asciiArr = ~serial.read.asAscii;// read serial input
		if(asciiArr.isDecDigit, {~charArray = ~charArray.add(asciiArr)});// add all digits to charArray

		// Ultrasonic 1
		if(asciiArr == $a, {~aVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
		    //~orgVolOne.getSynchronous.postln;
				if(~aVal < 150, {
				//" distance 1: ".post;
				~aVal = (~aVal * ~uFac).dbamp;
				~orgSigOne.set(\in, ~aVal*~volFac);
				~orgMSigOne.set(\in, ~aVal*~fmFac);
				});

				if(~aVal > 150, {
				~orgSigOne.set(\in, 0);
				~orgMSigOne.set(\in, 0);
			});

				if(~aVal < 155, {
				~aVal = (~aVal * ~uFac).dbamp;
				~volSig.set(\inOne, -12.dbamp, \lag, 1800);
				});

				if(~aVal > 155, {
				~volSig.set(\inOne, 0, \lag, 15);
				});

				if(~aVal < 150, {
				~volSig.set(\inOne, 0, \lag, 15);
				});
		});

		// Ultrasonic 2
		if(asciiArr == $b, {~bVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			//~bVal.post;
				if(~bVal < 150, {
				//" distance 2: ".post;
				~bVal = (~bVal * ~uFac).dbamp;
				~orgSigTwo.set(\in, ~bVal*~volFac);
				~orgMSigTwo.set(\in, ~bVal*~fmFac);
				//~volSig.set(\inTwo, ~bVal);
				});

				if(~bVal > 150, {
				~orgSigTwo.set(\in, 0);
				~orgMSigTwo.set(\in, 0);
				//~volSig.set(\inTwo, 0)
			});

				if(~bVal < 155, {
				~bVal = (~bVal * ~uFac).dbamp;
				~volSig.set(\inTwo, -12.dbamp, \lag, 1800);
				});

				if(~bVal > 155, {
				~volSig.set(\inTwo, 0, \lag, 15);
				});

				if(~bVal < 150, {
				~volSig.set(\inTwo, 0, \lag, 15);
				});
		});

		// Ultrasonic 3
		if(asciiArr == $c, {~cVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			//~cVal.post;
				if(~cVal < 150, {
				//" distance 3: ".post;
				~cVal = (~cVal * ~uFac).dbamp;
				~orgSigTre.set(\in, ~cVal*~volFac);
				~orgMSigTre.set(\in, ~cVal*~fmFac);
				//~volSig.set(\inTre, ~cVal);
				});

				if(~cVal > 150, {~orgSigTre.set(\in, 0);
					~orgMSigTre.set(\in, 0);
					//~volSig.set(\inTre, 0);
				});

				if(~cVal < 155, {
				~cVal = (~cVal * ~uFac).dbamp;
					~volSig.set(\inTre,  -12.dbamp, \lag, 1800);
				});
				if(~cVal > 155, {
				~volSig.set(\inTre, 0, \lag, 15);
				});

				if(~cVal < 150, {
				~volSig.set(\inTre, 0, \lag, 15);
				});

		});

		// Ultrasonic 4
		if(asciiArr == $d, {~dVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			//~dVal.post;
				if(~dVal < 150, {
				//" distance 4: ".post;
				~dVal = (~dVal * ~uFac).dbamp;
				~orgSigFor.set(\in, ~dVal*~volFac);
				~orgMSigFor.set(\in, ~dVal*~fmFac);
				});

				if(~dVal > 150, {
					~orgSigFor.set(\in, 0);
					~orgMSigFor.set(\in, 0);
				});

				if(~dVal < 155, {
				~dVal = (~dVal * ~uFac).dbamp;
				~volSig.set(\inFor,  -12.dbamp, \lag, 1800);
				});

				if(~dVal > 155, {
				~volSig.set(\inFor, 0, \lag, 15);
				});

				if(~dVal < 150, {
				~volSig.set(\inFor, 0, \lag, 15);
				});

		});

		// Ultrasonic 5
		if(asciiArr == $e, {~eVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			//~eVal.post;

				if(~eVal < 150, {
				//" distance 5: ".post;
				~eVal = (~eVal * ~uFac).dbamp;
				~orgSigFiv.set(\in, ~eVal*~volFac);
				~orgMSigFiv.set(\in, ~eVal*~fmFac);
				});
				if(~eVal > 150, {
					~orgSigFiv.set(\in, 0);
					~orgMSigFiv.set(\in, 0);
				});

				if(~eVal < 155, {
				~eVal = (~eVal * ~uFac).dbamp;
				~volSig.set(\inFiv,  -12.dbamp, \lag, 1800);
				});
				if(~eVal > 155, {
				~volSig.set(\inFiv, 0, \lag, 15);
				});
				if(~eVal < 150, {
				~volSig.set(\inFiv, 0, \lag, 15);
				});
		});

		// Ultrasonic 6
		if(asciiArr == $f, {~fVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values

			//~fVal.postln;
				if(~fVal < 150, {
				//" distance 6: ".post;
				~fVal = (~fVal * ~uFac).dbamp;
				~orgSigSix.set(\in, ~fVal*~volFac);
				~orgMSigSix.set(\in, ~fVal*~fmFac);
				});

				if(~fVal > 150, {
					~orgSigSix.set(\in, 0);
					~orgMSigSix.set(\in, 0);
				});

				if(~fVal < 155, {
				~fVal = (~fVal * ~uFac).dbamp;
				~volSig.set(\inSix,  -12.dbamp, \lag, 1800);
				});

				if(~fVal > 155, {
					~volSig.set(\inSix, 0, \lag, 15);
				});

				if(~fVal < 150, {
					~volSig.set(\inSix, 0, \lag, 15);
				});
		});

		////////////////////////////////
		// SCD40 Environmental Sensor //
		////////////////////////////////

		// SCD40 CO2
		if(asciiArr == $g, {~gVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			~co2Count = ~gVal / 300.0;
			" CO2: ".post;
			~co2Count.post;

		});

		// SCD40 Humidity
		if(asciiArr == $h, {~hVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			~hVal = ~hVal / 100.0;
			~humCount = ~hVal / 300.0;
			//post values
			" Humidity: ".post;
			~humCount.post;

		});

		// SCD40 Temperature
		if(asciiArr == $i, {~iVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			~iVal = ~iVal / 100.0;
			~temCount = ~iVal / 10.0;
			//post values
			" Temperature: ".post;
			~temCount.postln;
			~headCount = (~co2Count + ~humCount + ~temCount) / 3.0;
			"HeadCount: ".post;
			~headCount.postln;



				//
		});

		// Theremin Antenna
		if(asciiArr == $j, {
			//collect value
			~jVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//value conditioning
			~jVal = ~jVal / 100; // convert to value between 0.0 ~ 1.0
				~screamVol = ~jVal;
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

		});

	// timer
	~timeInt.wait;
	}.loop;
}).play;

};

