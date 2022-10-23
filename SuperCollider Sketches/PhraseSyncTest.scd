(
~root = 261;
~clock = 60/140;
~guitarP1 = [
	~root * 1,
	~root * 3/2,
	~root * 2/1,
	~root * 9/4,
	~root * 5/2,
	~root * 9/4,
	~root * 2/1,
	~root * 3/2,
	~root * 1,
	~root * 3/2,
	~root * 2/1,
	~root * 9/4,
	~root * 5/2,
	~root * 9/4,
	~root * 2/1,
	~root * 3/2,
];

~guitarP2 = [
	~root * 4/3,
	~root * 5/3,
	~root * 2/1,
	~root * 9/4,
	~root * 5/2,
	~root * 9/4,
	~root * 2/1,
	~root * 5/3,
	~root * 4/3,
	~root * 5/3,
	~root * 2/1,
	~root * 9/4,
	~root * 5/2,
	~root * 9/4,
	~root * 2/1,
	~root * 5/3,
];

~pianoP1 = [
	~root * 15/8,
	~root * 3/2,
	~root * 2/1,
	~root * 15/8,
	~root * 3/2,
	~root * 2/1,
	~root * 15/8,
	~root * 3/2,
	~root * 2/1,
	~root * 15/8,
	~root * 3/2,
	~root * 2/1,
	~root * 15/8,
	~root * 3/2,
	~root * 2/1,
	~root * 15/8
];

~pianoP2 = [
	~root * 3/2,
	~root * 5/3,
	~root * 2/1,
	~root * 3/2,
	~root * 5/3,
	~root * 2/1,
	~root * 3/2,
	~root * 5/3,
	~root * 2/1,
	~root * 3/2,
	~root * 5/3,
	~root * 2/1,
	~root * 3/2,
	~root * 5/3,
	~root * 2/1,
	~root * 3/2,
];


~root = 261;


~guitarPhrase1 = Pbind(\instrument,
	\sawSynth,
	\dur, ~clock,
	\oFreq, Pseq(~guitarP1, 1),
	\mVol, 0.2,
	\pan, 1
);

~pianoPhrase1 = Pbind(
		\instrument, \fmSynth,
	\dur, ~clock,
	\aAtk, 0.01,
	\aDec, 1,
	\fmAmt, 2,
	\oFreq, Pseq(~pianoP1, 1),
	\mVol, 0.3,
	\pan, 0
);

~guitarPhrase2 = Pbind(\instrument,
	\sawSynth,
	\dur, ~clock,
	\oFreq, Pseq(~guitarP2, 1),
	\mVol, 0.2,
	\pan, 1
);
~pianoPhrase2 = Pbind(
		\instrument, \fmSynth,
	\dur, ~clock,
	\aAtk, 0.01,
	\aDec, 1,
	\fmAmt, 2,
	\oFreq, Pseq(~pianoP2, 1),
	\mVol, 0.3,
	\pan, 0
);

//~play = Prand([
//	[~guitarPhrase1, ~pianoPhrase1],
//	[~guitarPhrase2,	~pianoPhrase2]
//], inf);

//Pdef(\d, ~play).play;
//)

//(
Routine({{
	var sel;

	sel = Prand([1, 2], inf).asStream;

	sel.next.postln;

	if(sel.next == 1, {
		sel.postln;
		~guitarPhrase1.play;
		~pianoPhrase1.play;
		(~pianoP1.size * ~clock).wait;
	});

	if(sel.next == 2, {
		sel.postln;
		~guitarPhrase2.play;
		~pianoPhrase2.play;
		(~oianoP2.size * ~clock).wait;
	});

}.loop;
}).play;
)

~guitarP1.size * ~clock;