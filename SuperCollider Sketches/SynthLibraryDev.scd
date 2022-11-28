//Compilation of All of my Supercollider Synthdefs
(
~timeInt = 0.01;
	////////////////
	// The Scream //
	////////////////
//(
SynthDef(\scream,{
		arg out=0, oFreq=1000, fmMult = 16.18, aAmt=0.3, fmAmt=10, aAtk= 0.4, aDec=60, pan=0, mVol = 1.0, gate=1;
		var osc, ampEnv, filtOne, filtTwo, filtTre, sig;
	osc = SinOsc.ar(oFreq, SinOsc.ar((oFreq * (fmMult.lag(~timeInt * 400))/ (141.42135623731*2)), 0, fmAmt), mul: 1);
		filtOne = BPF.ar(osc, 660, 130/660, 4);
		filtTwo = BPF.ar(osc, 1720, 700/1720, 4);
		filtTre = BPF.ar(osc, 2410, 160/2410, 4);
		ampEnv = EnvGen.kr(Env.new([0,aAmt,0], [aAtk,aDec]), gate, doneAction: 0);
		//fmEnv = EnvGen.kr(Env.new([0,1,0], fmAtk, fmDec), gate);
		sig = Out.ar(out, Pan2.ar(((filtOne + filtTwo + filtTre) * ampEnv) * mVol/*.lag(~timeInt*20)*/, pan));
	}).add;

	//////////////////
	// PBind Synths //
	//////////////////

	//////////////
	// FM Synth //
	//////////////

	SynthDef(\fmSynth,{
	arg out=0, oFreq=[100, 200], fmMult = 1, aAmt=0.3, fmAmt=1, aAtk= 0.4, aDec=4, fmAtk = 0.1, fmDec = 0.2, pan=0, mVol = 1.0, gate=1;
		var osc, ampEnv, fmEnv, sig;
		osc = SinOsc.ar(oFreq, SinOsc.ar((oFreq * fmMult), 0, fmAmt), mul: 1);
		ampEnv = EnvGen.kr(Env.new([0,aAmt,0], [aAtk,aDec]), gate, doneAction: 2);
		fmEnv = EnvGen.kr(Env.new([0,1,0], fmAtk, fmDec), gate);
		sig = Out.ar(out, Pan2.ar((osc * ampEnv) * mVol, pan));
	}).add;

////////////////////////////////////////////////////////////////////////////////////
///Guitar
// A STRING ////////////////////////////////////////////////////////////////////
~gtrAfreqs = [
	1	,
	2	,
	3	,
	4	,
	5	,
	6	,
	7	,
	8	,
	9	,
	10	,
	11.146732	,
	12.214312	,
	13.295501	,
	14.762553	,
	16.445145	,
	18.770395	,
	20.025521	,
	21.008311	,
	22.038536	,
	25.5556410493227	,
	26.866184	,
	28.141965	,
	44.330584	,
	45.670001	,
	46.258030	,
	49.402978	,
	69.340629	,
	127.640819	,
	128.184420	,
	133.651598	,
	209.948631945492	,
	218.686657	];

~gtrAamps = [	0.97675	,
	0.335860	,
	0.045220	,
	0.057319	,
	0.057896	,
	0.058189	,
	0.058364	,
	0.082918	,
	0.133137	,
	0.068271	,
	0.069920	,
	0.058122	,
	0.058537	,
	0.067489	,
	0.069440	,
	0.058035	,
	0.057994	,
	0.058537	,
	0.057981	,
	0.063655	,
	0.058591	,
	0.056371	,
	0.058079	,
	0.064199	,
	0.058098	,
	0.057957	,
	0.054374	,
	0.062989	,
	0.064813	,
	0.055379	,
	0.057426	,
	0.052028	];

~gtrAdecs = [	20.743549	,
	15.4085340	,
	13.423482	,
	14.362746	,
	6.527152	,
	5.324206	,
	4.138806	,
	0.113832	,
	1.752076	,
	1.942217	,
	1.345447	,
	1.438162	,
	0.649178	,
	0.624364	,
	0.422911	,
	0.446760	,
	0.359113	,
	0.178129	,
	0.228026	,
	0.257306	,
	0.216378	,
	0.153993	,
	0.178718	,
	0.092644	,
	0.115335	,
	0.117126	,
	0.091150	,
	0.084396	,
	0.102950	,
	0.082194	,
	0.080661	,
	0.072172	];

// B STRING//////////////////////////////////////////////////////////
~gtrBfreqs = [	1.0000000	,
	2.023452345	,
	3.02453452	,
	4.02350254	,
	5.00123405	,
	6.01254034	,
	7.01234253,
	8.02345345	,
	9.02342353	,
	10.0230452	,
	11.0023412	,
	12.0023453	,
	13.0234234	,
	13.0234234	,
	14.1068017319472	,
	14.1136088998884	,
	15.130423187892	,
	16.1514297612477	,
	16.8703592	,
	17	,
	19.2560156819749	,
	21.337602832399	,
	22.3863858901129	,
	23.4368301020244	,
	24.4966618800056	,
	28.7712534711969	,
	29.8499963538081	,
	34.260711646268	,
	35.3553566474115	,
	49.2189880076001	,
	52.9016740238224	,
	57.8894371454018	];

~gtrBamps = [	0.011787	,
	0.036995	,
	0.025497	,
	0.026451	,
	0.026054	,
	0.038742	,
	0.032417	,
	0.038872	,
	0.038773	,
	0.025909	,
	0.067253	,
	0.025681	,
	0.025909	,
	0.050339	,
	0.025764	,
	0.041214	,
	0.026260	,
	0.025970	,
	0.070160	,
	0.037071	,
	0.026054	,
	0.025620	,
	0.026207	,
	0.026337	,
	0.025520	,
	0.025917	,
	0.026176	,
	0.026154	,
	0.026215	,
	0.025940	,
	0.026138	,
	0.026344	];

~gtrBdecs = [	14.019150	,
	15.593895	,
	12.231354	,
	7.362114	,
	5.653084	,
	3.791962	,
	4.913368	,
	4.364693	,
	4.414925	,
	3.928398	,
	2.401558	,
	2.300812	,
	2.312988	,
	0.082314	,
	2.640511	,
	0.069977	,
	2.579514	,
	1.166374	,
	0.1214370	,
	1.965454	,
	1.355042	,
	1.967354	,
	1.581306	,
	1.691742	,
	1.468079	,
	1.480194	,
	1.006660	,
	0.430626	,
	0.779945	,
	0.441284	,
	0.528526	,
	0.505051	];



SynthDef(\guitarLO,{
		arg out = 1, oFreq=198, aAmt=1, aAtk= 0.0002, aDec= 5.98, nAmt= 0.2, iAtk = 0.017, iDec=0.005, fFreq = 1000, pan= 0, mVol = 0.5, hVol = 5, expMin = 1, expMax = 1.3, gate=1;
		var osc, ampEnv, impEnv, ampExp, decExp, hit, bow, pick, filt, sig;
		ampEnv = EnvGen.kr(Env.new([0,aAmt,0], [aAtk,aDec]), gate, doneAction: 2);
		impEnv = EnvGen.kr(Env.new([0, hVol, 0], [iAtk, iDec]));
	    ampExp = Array.rand(32, expMin, expMax);
	    decExp = Array.rand(32, expMin, expMax);
		bow = RLPF.ar(WhiteNoise.ar(impEnv),fFreq);
		pick = SinOsc.ar(100 * (impEnv), 0, impEnv);
		osc = Klank.ar(`[~gtrAfreqs * oFreq, ~gtrAamps * ampExp, ~gtrAdecs * decExp], bow + pick );
		filt = RLPF.ar(RHPF.ar(osc * 0.004), 20000);
		sig = Out.ar(out, Pan2.ar((mVol * ((filt + (0.01) * ampEnv))), pan));
	}).add;
SynthDef(\guitarHI,{
		arg out = 1, oFreq=247, aAmt=1, aAtk= 0.0002, aDec= 5.98, nAmt= 0.2, iAtk = 0.0017, iDec=0.00005, fFreq = 100, pan= 0, mVol = 0.5, hVol = 5, expMin = 1, expMax = 1.3, gate=1;
		var osc, ampEnv, impEnv, hit, bow, pick, filt, sig, ampExp, decExp;
		ampEnv = EnvGen.kr(Env.new([0,aAmt,0], [aAtk,aDec]), gate, doneAction: 2);
		impEnv = EnvGen.kr(Env.new([0, hVol, 0], [iAtk, iDec]));
	    ampExp = Array.rand(32, expMin, expMax);
	    decExp = Array.rand(32, expMin, expMax);
		bow = RLPF.ar(WhiteNoise.ar(impEnv),fFreq);
		pick = SinOsc.ar(oFreq/3 * (impEnv), 0, impEnv);
	osc = Klank.ar(`[~gtrBfreqs * oFreq, ~gtrBamps * ampExp, ~gtrBdecs * decExp], (bow*0.5) /*+ pick*/ );
		filt = RLPF.ar(RHPF.ar(osc * 0.01), 20000);
		sig = Out.ar(out, Pan2.ar((mVol * ((filt + (0.01) * ampEnv))), pan));
	}).add;

// A STRING ////////////////////////////////////////////////////////////////////
~pnoC2freqs = [	1.000000	,
	2	,
	3	,
	4	,
	5	,
	6	,
	7	,
	8.076607	,
	8.092987	,
	9	,
	10	,
	11	,
	12	,
	13.236745	,
	14.272448	,
	15.307159	,
	16.295717	,
	17.411195	,
	18.417320	,
	19.529941	,
	19.545831	,
	21.672175	,
	22.752146	,
	24.148332	,
	27	,
	28.174994	,
	29.341302	,
	30.481561	,
	31.543237	,
	33.749615	,
	40	,
	49.492594	];

~pnoC2amps = [	1.000000	,
	0.5	,
	0.333333333333333	,
	0.25	,
	0.2	,
	0.166666666666667	,
	0.142857142857143	,
	0.123814	,
	0.123564	,
	0.111111111111111	,
	0.1	,
	0.0909090909090909	,
	0.0833333333333333	,
	0.075547	,
	0.070065	,
	0.065329	,
	0.061366	,
	0.057434	,
	0.054297	,
	0.051203	,
	0.051162	,
	0.046142	,
	0.043952	,
	0.041411	,
	0.037037037037037	,
	0.035492	,
	0.034082	,
	0.032807	,
	0.031703	,
	0.029630	,
	0.025	,
	0.020205	];

~pnoC2decs = [	27.275002	,
	29.837502	,
	28.100000	,
	29.887501	,
	29.900000	,
	29.725000	,
	24.075001	,
	28.725000	,
	29.525002	,
	29.862501	,
	29.500000	,
	29.537500	,
	27.425001	,
	14.747404	,
	13.400002	,
	12.575001	,
	12.200001	,
	11.075001	,
	10.700001	,
	9.475000	,
	5.287500	,
	0.412500	,
	0.225000	,
	0.737501	,
	0.375000	,
	0.050001	,
	0.812500	,
	0.812500	,
	0.662500	,
	0.375000	,
	0.612501	,
	0.912500	];

//PIANO C4

~pnoC4freqs = [	1.000000	,
	5.025206	,
	6.046790	,
	15.970093	,
	9.130202	,
	7.068795	,
	4.017706	,
	3.009281	,
	2.004238	,
	20.807812	,
	20.293256	,
	18.173042	,
	13.407308	,
	12.305521	,
	11.250966	,
	21.528974	];

~pnoC4amps = [	1.000000	,
	0.198997	,
	0.165377	,
	0.062617	,
	0.109527	,
	0.141467	,
	0.248898	,
	0.332305	,
	0.498943	,
	0.048059	,
	0.049277	,
	0.055027	,
	0.074586	,
	0.081264	,
	0.088881	,
	0.046449	];

~pnoC4decs = [	7.762501	,
	7.762501	,
	7.725002	,
	7.700001	,
	3.799999	,
	6.200001	,
	6.475002	,
	1.412502	,
	2.562500	,
	1.812500	,
	2.225002	,
	1.750000	,
	1.750000	,
	1.450001	,
	1.525002	,
	1.750000	] * 6;

SynthDef(\PianoC2,{
		arg out = 0, oFreq=198, aAmt=1, aAtk= 0.0002, aDec= 5.98, nAmt= 0.2, iAtk = 0.017, iDec=0.00005, fFreq = 20000, pan= 0, mVol = 0.5, hVol = 2, gate=1;
		var osc, ampEnv, impEnv, hit, bow, pick, filt, sig;
		ampEnv = EnvGen.kr(Env.new([0,aAmt,0], [aAtk,aDec]), gate, doneAction: 2);
		impEnv = EnvGen.kr(Env.new([0, hVol, 0], [iAtk, iDec]));
		bow = RLPF.ar(WhiteNoise.ar(impEnv),fFreq);
		pick = SinOsc.ar(100 * (impEnv), 0, impEnv);
		osc = Klank.ar(`[~pnoC2freqs * oFreq, ~pnoC2amps, ~pnoC2decs] , pick+bow);
	    filt = FreeVerb.ar(RLPF.ar(RHPF.ar(osc * 0.01), 20000), 0.45, 0.8, 0.5);
		sig = Out.ar(out, Pan2.ar((mVol * ((filt + (0.01) * ampEnv))), pan));
	}).add;

SynthDef(\PianoC4,{
		arg out = 1, oFreq=247, aAmt=1, aAtk= 0.0002, aDec= 5.98, nAmt= 0.2, iAtk = 0.017, iDec=0.00005, fFreq = 2000, pan= 0, mVol = 0.5, hVol = 5, gate=1;
		var osc, ampEnv, impEnv, hit, bow, pick, filt, sig;
		ampEnv = EnvGen.kr(Env.new([0,aAmt,0], [aAtk,aDec]), gate, doneAction: 2);
		impEnv = EnvGen.kr(Env.new([0, hVol, 0], [iAtk, iDec]));
		bow = RLPF.ar(WhiteNoise.ar(impEnv),fFreq);
	    pick = SinOsc.ar(100 * (impEnv), 0, ((impEnv/nAmt)*0.3));
		osc = Klank.ar(`[~pnoC4freqs * oFreq, ~pnoC4amps, ~pnoC4decs], bow + pick );
	    filt = FreeVerb.ar(RLPF.ar(RHPF.ar(osc * 0.01), 20000), 0.45, 0.8, 0.5);
		sig = Out.ar(out, Pan2.ar((mVol * ((filt + (0.01) * ampEnv))), pan));
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

	//)//end of addAll
)

