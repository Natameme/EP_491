~comp_func = {
~root = 261;
~p3.stop;
Pdef(\p3, ~p3 = Pbind(
	\instrument, \PianoC3,
	\dur, 0.5,
	\oFreq, Pwrand([
	Pwrand(
	// ISOLATION section 1
	[
			Pseq(// 1m6
			[//notes
						~root * 1,
						~root * 3/2,
						~root * 8/5,
						~root * 19/8,
						~root * 8/5,
						~root * 3/2,
						~root * 19/8,
						~root * 3/2
					],
					1)//# of repeats
			,
			Pseq(// 7 major
			[//notes
						~root * (7/8),
						~root * (7/8)*(5/3),
						~root * (7/8)*(7/4),
						~root * (7/8)*(85/32),
						~root * (7/8)*(7/4),
						~root * (7/8)*(5/3),
						~root * (7/8)*(85/32),
						~root * (7/8)*(5/3),
					],
					1)//# of repeats
			,
			Pseq(// b6 major
			[//notes
						~root * (4/5),
						~root * (4/5)*(15/8),
						~root * (4/5)*(2),
						~root * (4/5)*(3),
						~root * (4/5)*(2),
						~root * (4/5)*(15/8),
						~root * (4/5)*(3),
						~root * (4/5)*(15/8),
					],
					1)//# of repeats
			],//END OF SECTION 1
		//Weights
			[0.333, 0.333, 0.333], Prand([2, 4, 6], inf))
			,// ISOLATION section 2
		Pwrand(
	[
		Pseq(// 1m6
		 	[//notes
			~root * 1,
			~root * 3/2,
			~root * 8/5,
			~root * 19/8,
			~root * 8/5,
			~root * 3/2,
			~root * 19/8,
			~root * 3/2,
			// 7 neutral
			~root * (15/16),
			~root * (15/16) * (8/5),
			~root * (15/16) * (8/5) * (3/2).sqrt,
			~root * (15/16) * (8/5) * (3/2).sqrt * (3/2).sqrt,
			~root * (15/16) * (8/5) * (3/2).sqrt,
			~root * (15/16) * (8/5),
			~root * (15/16),
			~root * (15/16)*(3/2).sqrt
			], 1)//# of repeats

		],//END OF SECTION 2
			[1], 2)
		,
		//SECTION 3
		Pseq(// b3 major > 4 minor
			[//notes
						~root * (3/5),
						~root * (3/5)*(3/2),
						~root * (3/5)*(9/4),
						~root * (3/5)*(5/2),
						~root * (3/5)*(9/8),
						~root * (3/5)*(9/8)*(3/2),
						~root * (3/5)*(9/8)*(3/2)*(25/16),
						~root * (3/5)*(9/8)*(3/2)*(3/2),
					],//END OF SECTION 3
					1)//# of repeat
	], [0.45, 0.45,0.1], inf);
)).play;
}