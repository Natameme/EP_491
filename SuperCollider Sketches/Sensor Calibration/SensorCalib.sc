(
~path = PathName(thisProcess.nowExecutingPath).parentPath;
~gFile = File.open(~path ++ "CO2_" ++ Date.getDate.month ++ "_" ++ Date.getDate.day ++ "_" ++ Date.getDate.year ++ ".csv", "w");
~hFile = File.open(~path ++ "Temperature_" ++ Date.getDate.month ++ "_" ++ Date.getDate.day ++ "_" ++ Date.getDate.year ++ ".csv", "w");
~iFile = File.open(~path ++ "Humidity_" ++ Date.getDate.month ++ "_" ++ Date.getDate.day ++ "_" ++ Date.getDate.year ++ ".csv", "w");

~serial    = SerialPort.new("/dev/tty.usbserial-026019A3", 115200);
)
(
// Global Variables
//~timeInt     = 0.0001; // loop wait time in seconds
~charArray   = [ ];
~gVal        = 0;//SCD40 CO2
~hVal        = 0;//SCD40 Humidity
~iVal        = 0;//SCD40 Temperature

	/////////////////////////////
	// call modules to control //
	/////////////////////////////



~sensorTrack = Routine.new({
	var asciiArr;
	{
		asciiArr = ~serial.read.asAscii;// read serial input
		if(asciiArr.isDecDigit, {~charArray = ~charArray.add(asciiArr)});// add all digits to charArray

		////////////////////////////////
		// SCD40 Environmental Sensor //
		////////////////////////////////

		// SCD40 CO2
		if(asciiArr == $g, {~gVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];

			"CO2: ".post;
			~gVal.postln;

			~gFile.write(
				Date.getDate.hourStamp ++ ", " ++ ~gVal ++ ";";
			);

		});

		// SCD40 Humidity
		if(asciiArr == $h, {~hVal = ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
			//condition values
			~hVal = ~hVal / 100;

			"Humidity: ".post;
			~hval.postln;

			~hFile.write(
				Date.getDate.hourStamp ++ ", " ++ ~hVal ++ ";";
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
				Date.getDate.hourStamp ++ ", " ++ ~iVal ++ ";";
			);
		});

	// timer
	0.1.wait;
	}.loop;
}).play;

)

(//close files
~gFile.close;
~hFile.close;
~iFile.close;
)

"fuck".postln;