(
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
	1.750000	];

SynthDef(\pianoC2,{
		arg out = 0, oFreq=198, aAmt=1, aAtk= 0.0002, aDec= 5.98, nAmt= 0.2, iAtk = 0.017, iDec=0.00005, fFreq = 20000, pan= 0, mVol = 0.5, hVol = 2, gate=1;
		var osc, ampEnv, impEnv, hit, bow, pick, filt, sig;
		ampEnv = EnvGen.kr(Env.new([0,aAmt,0], [aAtk,aDec]), gate, doneAction: 2);
		impEnv = EnvGen.kr(Env.new([0, hVol, 0], [iAtk, iDec]));
		bow = RLPF.ar(WhiteNoise.ar(impEnv),fFreq);
		pick = SinOsc.ar(100 * (impEnv), 0, impEnv);
		osc = Klank.ar(`[~pnoC2freqs * oFreq, ~pnoC2amps, ~pnoC2decs] , pick+bow);
		filt = RLPF.ar(RHPF.ar(osc * 0.01,), 20000);
		sig = Out.ar(out, Pan2.ar((mVol * ((filt + (0.01) * ampEnv))), pan));
	}).add;

SynthDef(\pianoC4,{
		arg out = 1, oFreq=247, aAmt=1, aAtk= 0.0002, aDec= 5.98, nAmt= 0.2, iAtk = 0.017, iDec=0.00005, fFreq = 2000, pan= 0, mVol = 0.5, hVol = 5, gate=1;
		var osc, ampEnv, impEnv, hit, bow, pick, filt, sig;
		ampEnv = EnvGen.kr(Env.new([0,aAmt,0], [aAtk,aDec]), gate, doneAction: 2);
		impEnv = EnvGen.kr(Env.new([0, hVol, 0], [iAtk, iDec]));
		bow = RLPF.ar(WhiteNoise.ar(impEnv),fFreq);
	pick = SinOsc.ar(100 * (impEnv), 0, ((impEnv/nAmt)*0.3));
		osc = Klank.ar(`[~pnoC4freqs * oFreq, ~pnoC4amps, ~pnoC4decs], bow + pick );
		filt = RLPF.ar(RHPF.ar(osc * 0.01), 20000);
		sig = Out.ar(out, Pan2.ar((mVol * ((filt + (0.01) * ampEnv))), pan));
	}).add;

)
	\instrument, Pif(
		            Pkey(\oFreq) >= 128.0, \PianoC4,
		         Pif(
			        Pkey(\oFreq) <  128.0, \PianoC2).asStream).asStream,



x = Synth(\guitarE, [\oFreq, 110]);
x = Synth(\guitarE, [\oFreq, 147]);
x = Synth(\guitarB, [\oFreq, 196]);
x = Synth(\guitarB);
x = Synth(\guitarB, [\oFreq, 330]);
