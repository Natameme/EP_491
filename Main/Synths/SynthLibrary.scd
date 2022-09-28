//Compilation of All of my Supercollider Synthdefs
~lib_func={
	////////////////
	// The Scream //
	////////////////

	SynthDef(\scream,{
		arg out=0, oFreq=300, fmMult = 16.18, aAmt=0.3, fmAmt=10, aAtk= 0.4, aDec=60, fmAtk = 0.1, fmDec = 0.2, pan=0, mVol = 1.0, gate=1;
		var osc, ampEnv, filtOne, filtTwo, filtTre, fmEnv, sig;
	osc = SinOsc.ar(oFreq, SinOsc.ar((oFreq * fmMult.lag(~timeInt*20)), 0, fmAmt), mul: 1);
		filtOne = BPF.ar(osc, 660*(oFreq/20),  130/660, 2);
		filtTwo = BPF.ar(osc, 1720, 700/1720, 2);
		filtTre = BPF.ar(osc, 2410, 160/2410, 2);
		//ampEnv = EnvGen.kr(Env.new([0,aAmt,0], [aAtk,aDec]), gate, doneAction: 0);
		fmEnv = EnvGen.kr(Env.new([0,1,0], fmAtk, fmDec), gate);
		sig = Out.ar(out, Pan2.ar(((filtOne + filtTwo + filtTre) /*ampEnv*/) * mVol.lag(~timeInt*20), pan));
	}).add;


	//////////////////
	// PBind Synths //
	//////////////////


	//////////////
	// FM Synth //
	//////////////

	SynthDef(\fmSynth,{
		arg out=0, oFreq=100, fmMult = 1, aAmt=0.3, fmAmt=1, aAtk= 0.4, aDec=4, fmAtk = 0.1, fmDec = 0.2, pan=0, mVol = 1.0, gate=1;
		var osc, ampEnv, fmEnv, sig;
		osc = SinOsc.ar(oFreq, SinOsc.ar((oFreq * fmMult), 0, fmAmt), mul: 1);
		ampEnv = EnvGen.kr(Env.new([0,aAmt,0], [aAtk,aDec]), gate, doneAction: 2);
		fmEnv = EnvGen.kr(Env.new([0,1,0], fmAtk, fmDec), gate);
		sig = Out.ar(out, Pan2.ar((osc * ampEnv) * mVol, pan));
	}).add;

	/////////////
	//Boomwhacker
	/////////////
	SynthDef(\boomWhacker,{
		arg out= 1, oFreq=100, fFreq = 1000, fRes = 1, aAmt=0.1, aAtk= 0.001, aDec= 10, hAmt=0.001, nAmt= 0.05, iAtk = 0.007, iDec=0.09, pan= 0, mVol = 1.0, gate=1;
		var osc, ampEnv, hit, sig;
		ampEnv = EnvGen.kr(Env.new([0,1,0], [aAtk,aDec]), gate, doneAction: 2);
		hit = SinOsc.ar(XLine.kr(5000, 400, iDec), 0, XLine.kr(aAmt, 0, iDec)) + WhiteNoise.ar(XLine.kr(nAmt*2, 0, iDec));
		osc = Klank.ar(`
			[[//FREQUENCIES
				oFreq*1.0,
				oFreq*1.4,
				oFreq*1.7,
				oFreq*2.0,
				oFreq*3.0,
				oFreq*3.5,
				oFreq*4.0,
				oFreq*4.5,
				oFreq*4.67120181405896,
				oFreq*5.08390022675737,
				oFreq*5.77777777777778,
				oFreq*6.49886621315193,
				oFreq*7.03854875283447,
				oFreq*7.45578231292517,
				oFreq*7.78231292517007,
				oFreq*8.53061224489796],
			[//AMPLITUDES
				1,
				0.0891,
				0.0431,
				5.5590,
				1.479,
				0.1396,
				0.5888,
				0.0912,
				0.0525,
				0.0661,
				0.0422,
				0.0285,
				0.0588,
				0.0291,
				0.0467,
				0.0716],
			[//LENGTHS
				0.382,
				0.406,
				0.403,
				0.470,
				0.401,
				0.382,
				0.375,
				0.357,
				0.332,
				0.325,
				0.316,
				0.311,
				0.302,
				0.302,
				0.200,
				0.121,
				0.110]], hit);
		sig = Out.ar(out, Pan2.ar((osc * ampEnv) * mVol, pan));
	}).add;

	//////////////
	//Singing Bowl
	//////////////

	SynthDef(\singingBowl,{
		arg out = 1, oFreq=569.5, aAmt=1, aAtk= 0.001, aDec= 5.98, hAmt=0.9, nAmt= 1, iAtk = 0.007, iDec=0.022, fFreq = 10000, pan= 0, mVol = 1.0, hVol = 0.01, gate=1;
		var osc, ampEnv, hit, bow, filt, sig;
		ampEnv = EnvGen.kr(Env.new([0,aAmt,0], [aAtk,aDec]), gate, doneAction: 2);
		hit = SinOsc.ar(XLine.kr(900, 128, iDec), 0, XLine.kr(hAmt, 0, iDec));
		bow = WhiteNoise.ar(XLine.kr(nAmt*2, 0, iDec));
		osc = Klang.ar(`[[//FREQUENCIES
			oFreq *	1,
			oFreq * 2,
			oFreq *	1.99827288428325,
			oFreq * 2.9,
			oFreq *	2.90500863557858,
			oFreq *	3.81174438687392,
			oFreq *	5.18998272884283,
			oFreq *	5.61312607944732,
			oFreq *	6.19343696027634,
			oFreq *	8.00690846286701,
			oFreq *	11.1848013816926],
		[//AMPLITUDES
			1,
			0.0594328234724281	,
			0.0794328234724281	,
			0.112097519097331	,
			0.412097519097331	,
			0.00602559586074357	,
			0.173780082874938	,
			0.0030902954325136	,
			0.00139636836105594	,
			0.0457088189614875,
			0.00568852930843842	],
		[//LENGTHS
			23.98,
			8.58,
			13.66,
			5.022,
			5.596,
			3.645,
			2.411,
			2.927,
			2.124]]);
		filt = RLPF.ar(osc, fFreq);
		sig = Out.ar(out, Pan2.ar((mVol * ((filt * ampEnv)) + (hit * hVol)), pan));
	}).add;

	SynthDef(\wind, {
		arg out, amp = 1, gate = 1, atk = 1, dec= 4, lfoAmt= 0.01, lfoR= 0.1, lfoOfst= 0.3, ctf= 500, q = 10, mVol = 1.0;
		var env, sines;
		env = Linen.kr(
			gate, atk, 1, dec, 2);
		sines = RLPF.ar(WhiteNoise.ar(amp), ctf * SinOsc.kr(lfoR, 0, lfoAmt, lfoOfst) , q); // A mix of 8 oscillators
		Out.ar(out,
			(sines * env) * mVol);
	}, [0, 0.1, 0]).add;


	SynthDef(\harmonica, {
		arg out= 1, oFreq=1050, fFreq = 500, fRes = 1, aAmt=1, aSus = 0.05, aRel = 1.75, aAtk= 0.1, aDec= 1, iDec=0.09, pan= 0, mVol = 1.0, gate=1;
		var osc, ampEnv, hit, sig;
		ampEnv = EnvGen.kr(Env.new([0,aAmt, aSus, 0], [aAtk, aDec, aRel]), gate, doneAction: 2);
		hit = RLPF.ar(WhiteNoise.ar(ampEnv), fFreq, 1, 1);
		osc = Klang.ar(`
			[[//Frequency
				oFreq *	0.903809523809524,
				oFreq *	1,
				oFreq *	1.0952380952381,
				oFreq *	2,
				oFreq *	3,
				oFreq *	4,
				oFreq *	5.00095238095238,
				oFreq *	6.00095238095238,
				oFreq *	7.00095238095238,
				oFreq *	8.00095238095238,
				oFreq *	9.00095238095238,
				oFreq *	10.0009523809524,
				oFreq *	11.0009523809524,
				oFreq *	12.0019047619048,
				oFreq *	13.0019047619048,
				oFreq *	14.0019047619048,
				oFreq *	15.0028571428571,
				oFreq *	16.0019047619048,
				oFreq *	17.0019047619048,
				oFreq *	18.0028571428571,
				oFreq *	19.0038095238095], [
				//Amplitude
				0.000184077200146896,
				0.11091748152624,
				0.000248313310529557,
				0.00732824533138904,
				0.0156675107010815,
				0.00501187233627272,
				0.0047315125896148,
				0.00616595001861482,
				0.00165958690743756,
				0.0049545019080479,
				0.0034276778654645,
				0.00489778819368446,
				0.00380189396320561,
				0.0038904514499428,
				0.00194984459975805,
				0.000266072505979881,
				0.000630957344480193,
				0.000398107170553497,
				0.000162181009735893,
				0.000237137370566166,
				0.000186208713666287], [
				]]);
		sig = Out.ar(out, Pan2.ar(((osc * ampEnv)+(hit*0.05)) * mVol, pan));
	}).add;

	//Guitar

	SynthDef(\guitar,{
		arg out = 1, oFreq=138, aAmt=1, aAtk= 0.0002, aDec= 5.98, hAmt=1, nAmt= 0.2, iAtk = 0.017, iDec=0.00005, fFreq = 2000, pan= 0, mVol = 0.5, hVol = 3, gate=1;
		var osc, ampEnv, impEnv, hit, bow, pick, filt, sig;
		ampEnv = EnvGen.kr(Env.new([0,aAmt,0], [aAtk,aDec]), gate, doneAction: 2);
		impEnv = EnvGen.kr(Env.new([0, hVol, 0], [iAtk, iDec]));
		bow = WhiteNoise.ar(impEnv);
		pick = SinOsc.ar(100 * (impEnv), 0, impEnv);
		osc = Klank.ar(`[[//FREQUENCIES
			oFreq *	0.5	,
			oFreq *	1	,
			oFreq *	1.51111111111111	,
			oFreq *	2.00740740740741	,
			oFreq *	2.51851851851852	,
			oFreq *	3.01481481481481	,
			oFreq *	3.23703703703704	,
			oFreq *	3.54074074074074	,
			oFreq *	4.04444444444444	,
			oFreq *	4.57037037037037	,
			oFreq *	5.07407407407407	,
			oFreq *	5.6	,
			oFreq *	6.05185185185185	,
			oFreq *	6.26666666666667	,
			oFreq *	6.65925925925926	,
			oFreq *	7.17777777777778	,
			oFreq *	7.71111111111111	,
			oFreq *	7.94814814814815	,
			oFreq *	8.25925925925926	,
			oFreq *	8.58518518518519	,
			oFreq *	8.81481481481481	,
			oFreq *	9.64444444444444	,
			oFreq *	10.4444444444444	,
			oFreq *	10.6814814814815	,
			oFreq *	11.0296296296296	,
			oFreq *	11.4296296296296	,
			oFreq *	11.6888888888889	,
			oFreq *	12.1925925925926    ,
			oFreq *	49.9393939393939    ,
			oFreq *	50.9393939393939    ,
			oFreq *	51.9393939393939    ,
			oFreq *	52.9393939393939    ,
			oFreq *	53.9393939393939    ,
			oFreq *	54.9393939393939    ,
			oFreq *	55.9393939393939    ,
			oFreq *	56.9393939393939    ,
			oFreq *	57.9393939393939    ,
			oFreq *	58.9393939393939    ,
			oFreq *	59.9393939393939    ,
			oFreq *	60.9393939393939    ,
			oFreq *	61.9393939393939    ,
			oFreq *	62.9393939393939    ,
			oFreq *	63.9393939393939    ,
			oFreq *	64.9393939393939    ,
			oFreq *	65.9393939393939    ,
			oFreq *	66.9393939393939    ,
			oFreq *	67.9393939393939    ,
			oFreq *	68.9393939393939    ,
			oFreq *	69.9393939393939    ,
			oFreq *	70.9393939393939    ,
			oFreq *	71.9393939393939    ,
			oFreq *	72.9393939393939    ,
		],
		[//AMPLITUDES
			0.75439937337154	,
			1	,
			0.337031796370251	,
			0.118776162394955	,
			0.184077200146895	,
			0.43108746168203	,
			0.1	,
			0.883911647281428	,
			0.654813389233575	,
			0.626464430759306	,
			0.581970085860998	,
			0.0977237220955809	,
			0.665958690743756	,
			0.0138038426460288	,
			0.075837404288444	,
			0.0660693448007595	,
			0.0501187233627272	,
			0.009636836105593	,
			0.075837404288444	,
			0.0186208713666286	,
			0.0407380277804112	,
			0.0025409727055493	,
			0.0195662143529007	,
			0.00462381021399261	,
			0.0312607936712395	,
			0.0133352143216332	,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001  ,
			0.0000000000000001	,
			0.0000000000000001	,
			0.0000000000000001  ],
		[//LENGTHS
			13.06	,
			16.01	,
			16.01	,
			16.01	,
			10.681	,
			8.588	,
			8.0	,
			8.0	,
			5.383	,
			5.0	,
			4.5	,
			2.8	,
			2.35	,
			2.179	,
			1.581	,
			1.495	,
			1.154	,
			1.196	,
			0.983	,
			0.769	,
			0.769	,
			0.769	,
			1.431	,
			0.769	,
			0.6	,
			0.55	,
			0.55	,
			0.55,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	,
			0.00371535229097172	]], bow + pick );
		filt = RLPF.ar(osc * 0.01, fFreq);
		sig = Out.ar(out, Pan2.ar((mVol * ((filt + (bow*0.01) * ampEnv))), pan));
	}).add;

	(
		SynthDef(\PianoC3,{
			arg out = 1, oFreq=160, aAmt=0.05, aAtk= 0.001, aDec= 5.98, hAmt=0.9, nAmt= 1, iAtk = 0.007, iDec=0.022, fFreq = 1000, pan= 0, mVol = 1.0, hVol = 0.01, gate=1;
			var osc, ampEnv, hit, bow, filt, sig;
			ampEnv = EnvGen.kr(Env.new([0,aAmt,0], [aAtk,aDec]), gate, doneAction: 2);
			hit = SinOsc.ar(XLine.kr(900, 128, iDec), 0, XLine.kr(hAmt, 0, iDec));
			bow = WhiteNoise.ar(XLine.kr(nAmt*2, 0, iDec));
			osc = Klank.ar(`[[//FREQUENCIES
				oFreq *	1	,
				oFreq *	2.0023023791251	,
				oFreq *	3.00613967766692	,
				oFreq *	4.00767459708365	,
				oFreq *	5.01151189562548	,
				oFreq *	6.01611665387567	,
				oFreq *	7.02302379125096	,
				oFreq *	8.02762854950115	,
				oFreq *	9.04067536454336	,
				oFreq *	10.0537221795856	,
				oFreq *	11.0667689946278	,
				oFreq *	12.07981580967	,
				oFreq *	13.1005372217959	,
				oFreq *	14.1289332310054	,
				oFreq *	15.1419800460476	,
				oFreq *	16.1857252494244	,
				oFreq *	17.2141212586339	,
				oFreq *	18.2578664620107	,
				oFreq *	19.2939370683039	,
				oFreq *	20.3376822716807	,
				oFreq *	21.3891020721412	,
				oFreq *	22.4405218726017	,
				oFreq *	23.4919416730622	,
				oFreq *	24.5587106676899	,
				oFreq *	25.6254796623177	,
				oFreq *	26.7075978511128	,
				oFreq *	27.7820414428243	,
				oFreq *	28.8564850345357	,
				oFreq *	30.2916346891788	],
			[//AMPLITUDES
				1	,
				1.09647819614318	,
				0.630957344480193	,
				0.489778819368446	,
				0.186208713666286	,
				0.242661009508241	,
				0.175994866380147	,
				0.136458313658892	,
				0.0331131121482591	,
				0.0602559586074355	,
				0.204173794466953	,
				0.0234422881531992	,
				0.079432823472428	,
				0.116144861384034	,
				0.00767361489361819	,
				0.0524807460249772	,
				0.0153108746168203	,
				0.025409727055493	,
				0.00803526122185615	,
				0.0167880401812256	,
				0.0350751873952567	,
				0.0173780082874937	,
				0.00638263486190547	,
				0.00676082975391981	,
				0.00954992586021436	,
				0.00582103217770868	,
				0.00645654229034657	,
				0.00741310241300914	,
				0.00245470891568502	],
			[//LENGTHS
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	,
				10	]], hit);
			filt = LPF.ar(FreeVerb.ar(osc, 0.5, 1, 0.1, 1), fFreq);
			sig = Out.ar(out, Pan2.ar((mVol * ((filt * ampEnv)) + (hit * hVol)), pan));
		}).add;

		SynthDef(\flue,{
	arg out = 1, oFreq=240, aAmt=1, aAtk= 0.2, aDec= 5.98, hAmt=0.9, nAmt= 0.1, iAtk = 0.7, iDec=0.022, fFreq = 10000, pan= 0.5, mVol = 0.5, hVol = 0.1, gate=1;
	var osc, bosc, ampEnv, tone, hit, bow, filt, sig;
	ampEnv = EnvGen.kr(Env.new([0,aAmt,0], [aAtk,aDec]), gate, doneAction: 2);
	bow = WhiteNoise.ar(nAmt);
	tone = Saw.ar(oFreq, mul: 0.012);
	hit = SinOsc.ar(XLine.kr(5000, 400, iDec), 0, XLine.kr(aAmt, 0, iDec)) + WhiteNoise.ar(XLine.kr(nAmt*2, 0, iDec));
	osc = Klang.ar(`[[//FREQUENCIES
		oFreq *	1	,
oFreq *	1.98900169204738	,
oFreq *	2.98815566835871	,
oFreq *	3.98434856175973	,
oFreq *	4.97884940778342	,
oFreq *	5.96446700507614	,
oFreq *	6.40862944162437	,
oFreq *	6.96277495769882	,
oFreq *	7.94839255499154	,
oFreq *	8.94670050761421	,
oFreq *	9.93231810490694	,
oFreq *	10.9348561759729	,
oFreq *	11.9204737732657	,
oFreq *	12.9230118443316	,
oFreq *	13.917089678511	,
oFreq *	14.919627749577	,
oFreq *	15.9052453468697	,
oFreq *	16.8950930626058	,
oFreq *	17.8891708967851	,
oFreq *	19.7123519458545	,
oFreq *	19.8900169204738	],
	[//AMPLITUDES
1	,
0.211348903983665	,
0.630957344480194	,
0.0543250331492433	,
0.3019951720402	,
0.0506990708274704	,
0.00582103217770871	,
0.0966050878989812	,
0.0213796208950223	,
0.0285101826750391	,
0.0305492111321551	,
0.0186208713666286	,
0.0609536897240168	,
0.0263026799189537	,
0.0171790838715759	,
0.00616595001861481	,
0.0162181009735893	,
0.0186208713666286	,
0.0171790838715759	,
0.0221309470960564	,
0.0144543977074593	],
	[//LENGTHS
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
		1	]], );
bosc = Klank.ar(`[[//FREQUENCIES
		oFreq *	1	,
oFreq *	1.98900169204738	,
oFreq *	2.98815566835871	,
oFreq *	3.98434856175973	,
oFreq *	4.97884940778342	,
oFreq *	5.96446700507614	,
oFreq *	6.40862944162437	,
oFreq *	6.96277495769882	,
oFreq *	7.94839255499154	,
oFreq *	8.94670050761421	,
oFreq *	9.93231810490694	,
oFreq *	10.9348561759729	,
oFreq *	11.9204737732657	,
oFreq *	12.9230118443316	,
oFreq *	13.917089678511	,
oFreq *	14.919627749577	,
oFreq *	15.9052453468697	,
oFreq *	16.8950930626058	,
oFreq *	17.8891708967851	,
oFreq *	19.7123519458545	,
oFreq *	19.8900169204738	],
	[//AMPLITUDES
1	,
0.211348903983665	,
0.630957344480194	,
0.0543250331492433	,
0.3019951720402	,
0.0506990708274704	,
0.00582103217770871	,
0.0966050878989812	,
0.0213796208950223	,
0.0285101826750391	,
0.0305492111321551	,
0.0186208713666286	,
0.0609536897240168	,
0.0263026799189537	,
0.0171790838715759	,
0.00616595001861481	,
0.0162181009735893	,
0.0186208713666286	,
0.0171790838715759	,
0.0221309470960564	,
0.0144543977074593	],
	[//LENGTHS
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
1	,
		1	]], input: tone*0.8 + (bow/8) );
	filt = RLPF.ar(/*(osc*0.8)+*/(bosc*0.7), fFreq);
	sig = Out.ar(out, Pan2.ar((mVol * ((filt * ampEnv))), pan));
}).add;
)
	//end of addAll
}

