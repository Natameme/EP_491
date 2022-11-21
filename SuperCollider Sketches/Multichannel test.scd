(
s.options.numOutputBusChannels = 2;
s.boot;
s.meter;
~mainBus = Bus.audio(s, 8);
~mainBus.scope;
)
(
{Out.ar(0, Splay.ar(In.ar(~mainBus, 8), 1))}.play;
{Out.ar([~mainBus.subBus(0),
	~mainBus.subBus(1),
	~mainBus.subBus(2),
	~mainBus.subBus(3),
	~mainBus.subBus(4),
	~mainBus.subBus(5),
	~mainBus.subBus(6),
	~mainBus.subBus(7),
], SinOsc.ar(100, 0, 0.4), 0)}.play;
)

Server.killAll;

~mainBus.isAudioOut

s.plot

"Natalie Hogue"