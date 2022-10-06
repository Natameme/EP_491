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

~co2Count = 1.5;
~humCount = 1.5;
~temCount = 1.5;

	/////////////////////////////
	// call modules to control //
	/////////////////////////////

~scream = Synth(\scream, [\gate, 0, \mVol, 0]);

~sensorTrack = Routine.new({
	var asciiArr;
	{
		asciiArr = ~serial.read.asAscii;// read serial input
		if(asciiArr.isDecDigit, {~charArray = ~charArray.add(asciiArr)});// add all digits to charArray

		// Ultrasonic 1
		if(asciiArr == $a, {~aVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			" distance 1: ".post;
			~aVal.post;

		});

		// Ultrasonic 2
		if(asciiArr == $b, {~bVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			" distance 2: ".post;
			~bVal.post;

		});

		// Ultrasonic 3
		if(asciiArr == $c, {~cVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			" distance 3: ".post;
			~cVal.post;

		});

		// Ultrasonic 4
		if(asciiArr == $d, {~dVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			" distance 4: ".post;
			~dVal.post;

		});

		// Ultrasonic 5
		if(asciiArr == $e, {~eVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			" distance 5: ".post;
			~eVal.post;

		});

		// Ultrasonic 6
		if(asciiArr == $f, {~fVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			" distance 6: ".post;
			~fVal.postln;

		});

		////////////////////////////////
		// SCD40 Environmental Sensor //
		////////////////////////////////

		// SCD40 CO2
		if(asciiArr == $g, {~gVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			~co2Count = ~gVal / 3000;
			" CO2: ".post;
			~gVal.post;

		});

		// SCD40 Humidity
		if(asciiArr == $h, {~hVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			~hVal = ~hVal / 100;
			~humCount = ~hVal / 300;
			//post values
			" Humidity: ".post;
			~hVal.post;

		});

		// SCD40 Temperature
		if(asciiArr == $i, {~iVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			~iVal = ~iVal / 100;
			~temCount = ~iVal / 10;
			//post values
			" Temperature: ".post;
			~iVal.postln;

		});

		// Theremin Antenna
		if(asciiArr == $j, {
			//collect value
			~jVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//value conditioning
			~jVal = ~jVal / 100; // convert to value between 0.0 ~ 1.0
				~screamVol  = (~jVal - 0.25).clip(0, 1); //
			" Theremin: ".post;
			~jVal.postln;

				// set mod params
				~scream.set(\mVol, ~screamVol, \fmMult, (~jVal * 20),\fmAmt, ~jVal, );

				if(~jVal > 0.01,
				{
						~scream.set(\gate, 1, \aDec, 5);
				},
				{
						~scream.set(\gate, 0);
				});

		});
	// timer
	~timeInt.wait;
	}.loop;
}).play;

};

