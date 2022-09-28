//followed SuperCollider Tutorial 19 from Eli Fieldsteel, Patron Saint of SuperCollider Tutorials
~serial_func = {
~serial    = SerialPort.new("/dev/tty.usbserial-028603DA", 115200);

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

	/////////////////////////////
	// call modules to control //
	/////////////////////////////

		// call scream synth
		~scream = Synth(\scream, [\gate, 1]);

~sensorTrack = Routine.new({
	var asciiArr;
	{
		asciiArr = ~serial.read.asAscii;// read serial input
		if(asciiArr.isDecDigit, {~charArray = ~charArray.add(asciiArr)});// add all digits to charArray

		// Ultrasonic 1
		if(asciiArr == $a, {~aVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			//" distance 1: ".post;
			//~aVal.post;
			//~timeInt.wait;

		});

		// Ultrasonic 2
		if(asciiArr == $b, {~bVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			//" distance 2: ".post;
			//~aVal.post;
			//~timeInt.wait;

		});

		// Ultrasonic 3
		if(asciiArr == $c, {~cVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			//" distance 3: ".post;
			//~cVal.post;
			//~timeInt.wait;

		});

		// Ultrasonic 4
		if(asciiArr == $d, {~dVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			//" distance 4: ".post;
			//~dVal.postln;
			//~timeInt.wait;

		});

		//////////////////////////////////////
		// ADD ULTRA 5 and 6 WHEN NECESSARY //
		//////////////////////////////////////

		// SCD40 CO2
		if(asciiArr == $g, {~gVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			//" CO2: ".post;
			//~gVal.post;
			//~timeInt.wait;

		});

		// SCD40 Humidity
		if(asciiArr == $h, {~hVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			~hVal = ~hVal / 100;
			//post values
			//" Humidity: ".post;
			//~hVal.post;
			//~timeInt.wait;

		});

		// SCD40 Temperature
		if(asciiArr == $i, {~iVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			~iVal = ~iVal / 100;
			//post values
			//" Temperature: ".post;
			//~iVal.postln;
			//~timeInt.wait;

		});

		// Theremin Antenna
		if(asciiArr == $j, {
			//collect value
			~jVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//value conditioning
			~jVal = ~jVal / 1023; // convert to value between 0.0 ~ 1.0
				~screamVol  = (~jVal - 0.25).clip(0, 1); //
			//" Theremin: ".post;
			//~jVal.postln;
				~scream.set(\mVol, ~screamVol, \fmMult, (~jVal * 20),\fmAmt, ~jVal, /*\fmAmt, ~jVal * 10*/);
		});
	// timer
	~timeInt.wait;
	}.loop;
}).play;


}

