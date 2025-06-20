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

	| kick snare hat conga |
	kick := TpSampler new
		        label: 'kick';
		        pathToFile:
			        '/Users/domenicocipriani/MyStuff/samples/California-Drums-Studio-City/Kicks/B-Kick3Nine.wav '.
	snare := TpSampler new
		         label: 'snare';
		         pathToFile:
			         '/Users/domenicocipriani/MyStuff/samples/California-Drums-Studio-City/Snares/Su-Snr3.wav'.
	hat := TpSampler new
		       label: 'hat';
		       pathToFile:
			       '/Users/domenicocipriani/MyStuff/samples/California-Drums-Studio-City/Hats/JS-Hat6.wav'.
	conga := TpSampler new
		         label: 'conga';
		         pathToFolder:
			         '/Users/domenicocipriani/Documents/TurboSamples/conga'.

	allSamplers := {kick . snare . hat . conga}
]

{ #category : 'loading' }
Corridor class >> loadAllSynths [
	"load all TurboSynths - kept empty for now"

	allSynths := OrderedCollection new.
	allSynths
	add: PhCapture new;
		add: PhLooper new;
		add: (TpReese new
				 sustain: 0.2 asBox;
				 attack: 0.01 asBox;
				 decay: 0.2 asBox);
		add: Dirac new.
		
]

{ #category : 'loading' }
Corridor class >> loadRack [
	"load the chain of synthesizers, effects and filter which become the TurboPhausto dsp"

	rack := self allInstruments asSumOfUGen
]
