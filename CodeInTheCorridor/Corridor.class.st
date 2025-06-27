"
TurboPhausto subclass loading different instruments
"
Class {
	#name : 'Corridor',
	#superclass : 'TurboPhausto',
	#instVars : [
		'kick',
		'snare',
		'hat',
		'conga'
	],
	#category : 'CodeInTheCorridor',
	#package : 'CodeInTheCorridor'
}

{ #category : 'loading' }
Corridor class >> loadAllSamplers [

	| kick snare hat conga pad hh |
	kick := TpSampler new
		        label: 'kick';
		        index: 0 asBox;
		        pathToFile:
			        '/Users/domenicocipriani/MyStuff/samples/California-Drums-Studio-City/Kicks/B-Kick3Nine.wav '.
	snare := TpSampler new
		         label: 'snare';
		index: 0 asBox;
		         pathToFile:
			         '/Users/domenicocipriani/MyStuff/samples/California-Drums-Studio-City/Snares/Su-Snr3.wav'.
	hat := TpSampler new
		       label: 'hat';
		       index: 0 asBox;
		       pathToFile:
			       '/Users/domenicocipriani/MyStuff/samples/California-Drums-Studio-City/Hats/JS-Hat6.wav'.
	conga := TpSampler new
		         label: 'conga';
		         pathToFolder:
			         '/Users/domenicocipriani/Documents/TurboSamples/conga'.
	pad := TpSampler new
		       label: 'pad';
		       index: 0 asBox;
		       pathToFile:
			       '/Users/domenicocipriani/Documents/MoofLodSamples/23_PadJunglAmb.wav'.

	hh := TpSampler new
		      label: 'hh';
		      index: 0 asBox;
		      pathToFile:
			      '/Users/domenicocipriani/MyStuff/samples/California-Drums-Studio-City/Hats/H-CH.wav'.

	allSamplers := {
		               kick.
		               snare.
		               hat.
		               conga.
		               pad.
		               hh }
]

{ #category : 'loading' }
Corridor class >> loadAllSynths [
	"load all TurboSynths - kept empty for now"

	| reese psg |
	reese := TpReese new
		         sustain: 0.2 asBox;
		         attack: 0.01 asBox;
		         decay: 0.2 asBox.
	psg := PsgPlus new
		       attack: 0.01 asBox;
		       decay: 0.25 asBox;
		       sustain: 0.3 asBox;
		       release: 0.19 asBox; dsfreq: 180 asBox ; q: 4 asBox.
	allSynths := {
		             PhCapture new.
		             PhLooper new.
		             reese.
		             Dirac new.
		             psg }.

	^ self
]

{ #category : 'loading' }
Corridor class >> loadRack [
	"load the chain of synthesizers, effects and filter which become the TurboPhausto dsp"

	rack := self allInstruments asSumOfUGen
]
