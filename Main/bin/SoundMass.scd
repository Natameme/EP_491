~soundMass = {
	Routine.new({
		{
			~ang  = 1.7320508075689;

			~pointOne = [0               , ~aVal    ]           ;
			~pointTwo = [~bVal * ~ang    , ~bVal    ] / ~ang    ;
			~pointTre = [~cVal * ~ang.neg, ~cVal    ] / ~ang.neg;
			~pointFor = [0               , ~dVal.neg]           ;
			~pointFiv = [~eVal.neg * ~ang, ~eVal.neg] / ~ang    ;
			~pointSix = [~fVal * ~ang.neg, ~fVal    ] / ~ang    ;

			~midOne = (~pointOne + ~pointFor) / 2;
			~midTwo = (~pointTwo + ~pointFiv) / 2;
			~midTre = (~pointTre + ~pointSix) / 2;

			~centerPoint = (1/3) * (~midOne + ~midTwo + ~midTre);

			~volArr = [0,0,0,0,0,0,0,0,0,0];
			//convert from centerPoint to 10 channel Volume
			~volArr[0] = sqrt(( 1.0              - ~centerPoint[0]).squared + ( 0                - ~centerPoint[1]).squared) / 2;
			~volArr[1] = sqrt(( 0.58778525229247 - ~centerPoint[0]).squared + ( 0.80901699437495 - ~centerPoint[1]).squared) / 2;
			~volArr[2] = sqrt(( 0.95105651629515 - ~centerPoint[0]).squared + ( 0.30901699437495 - ~centerPoint[1]).squared) / 2;
			~volArr[3] = sqrt(( 0.95105651629515 - ~centerPoint[0]).squared + (-0.30901699437495 - ~centerPoint[1]).squared) / 2;
			~volArr[4] = sqrt(( 0.58778525229247 - ~centerPoint[0]).squared + (-0.80901699437495 - ~centerPoint[1]).squared) / 2;
			~volArr[5] = sqrt(( 0                - ~centerPoint[0]).squared + (-1.0              - ~centerPoint[1]).squared) / 2;
			~volArr[6] = sqrt(( 0.58778525229247 - ~centerPoint[0]).squared + (-0.80901699437495 - ~centerPoint[1]).squared) / 2;
			~volArr[7] = sqrt(( 0.95105651629515 - ~centerPoint[0]).squared + (-0.30901699437495 - ~centerPoint[1]).squared) / 2;
			~volArr[8] = sqrt((-0.95105651629515 - ~centerPoint[0]).squared + ( 0.30901699437495 - ~centerPoint[1]).squared) / 2;
			~volArr[9] = sqrt((-0.58778525229247 - ~centerPoint[0]).squared + ( 0.80901699437495 - ~centerPoint[1]).squared) / 2;

			//~centerPoint.postln;
			//~volArr.postln;
			~volArr = ~volArr; /// 10.0;
			~timeInt.wait;
		}.loop;

	}).play;
}