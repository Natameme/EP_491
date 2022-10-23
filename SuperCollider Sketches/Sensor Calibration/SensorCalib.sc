SerialPort.listDevices;
(
~path = PathName(thisProcess.nowExecutingPath).parentPath;
~gFile = File.open(~path ++ "CO2_" ++ Date.getDate.month ++ "_" ++ Date.getDate.day ++ "_" ++ Date.getDate.year ++ ".csv", "w");
~hFile = File.open(~path ++ "Temperature_" ++ Date.getDate.month ++ "_" ++ Date.getDate.day ++ "_" ++ Date.getDate.year ++ ".csv", "w");
~iFile = File.open(~path ++ "Humidity_" ++ Date.getDate.month ++ "_" ++ Date.getDate.day ++ "_" ++ Date.getDate.year ++ ".csv", "w");

~serial    = SerialPort.new("/dev/tty.usbserial-026019A3", 115200);
//)
//(
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


	/////////////////////////////
	// call modules to control //
	/////////////////////////////



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

		});

		// Ultrasonic 2
		if(asciiArr == $b, {~bVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			//" distance 2: ".post;
			//~bVal.post;

		});

		// Ultrasonic 3
		if(asciiArr == $c, {~cVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			//" distance 3: ".post;
			//~cVal.post;

		});

		// Ultrasonic 4
		if(asciiArr == $d, {~dVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			//" distance 4: ".post;
			//~dVal.post;

		});

		// Ultrasonic 5
		if(asciiArr == $e, {~eVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			//" distance 5: ".post;
			//~eVal.post;

		});

		// Ultrasonic 6
		if(asciiArr == $f, {~fVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			//" distance 6: ".post;
			//~fVal.postln;

		});

		////////////////////////////////
		// SCD40 Environmental Sensor //
		////////////////////////////////

		// SCD40 CO2
		if(asciiArr == $g, {~gVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];

			"CO2: ".post;
			~gVal.postln;

			~gFile.write(
				Date.getDate.hourStamp ++ ", " ++ ~gVal ++ "\n";

			);

		});

		// SCD40 Humidity
		if(asciiArr == $h, {~hVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			~hVal = ~hVal / 100;

			"Humidity: ".post;
			~hVal.postln;

			~hFile.write(
				Date.getDate.hourStamp ++ ", " ++ ~hVal ++ "\n";

			);
		});

		// SCD40 Temperature
		if(asciiArr == $i, {~iVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			~iVal = ~iVal / 100;

			"Temperature: ".post;
			~iVal.postln;

			~iFile.write(
				Date.getDate.hourStamp ++ ", " ++ ~iVal ++ "\n";

			);
		});


		// Theremin Antenna
		if(asciiArr == $j, {
			//collect value
			~jVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//value conditioning
			~jVal = ~jVal / 100; // convert to value between 0.0 ~ 1.0
				~screamVol = ~j;
				~screamVol  = (~jVal - 0.25).clip(0, 1); //
			//" Theremin: ".post;
			//~jVal.postln;
		});

	// timer
	0.001.wait;
	}.loop;
}).play;

)

(//close files
~gFile.close;
~hFile.close;
~iFile.close;
~sensorTrack.stop;
)

"fuck".postln;