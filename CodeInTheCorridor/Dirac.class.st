"
Single sample pulse 
"
Class {
	#name : 'Dirac',
	#superclass : 'PhBox',
	#instVars : [
		'generator',
		'filter',
		'bass'
	],
	#category : 'CodeInTheCorridor-Instruments',
	#package : 'CodeInTheCorridor',
	#tag : 'Instruments'
}

{ #category : 'initialization' }
Dirac >> asBox [

	| level |
	level := PhHSlider new label: 'DiracLevel'.
	^ ((self generator + self bass) => self filter * level) asBox
]

{ #category : 'accessing' }
Dirac >> bass [

	^ bass
]

{ #category : 'accessing' }
Dirac >> bass: anObject [

	bass := anObject
]

{ #category : 'accessing' }
Dirac >> filter [

	^ filter
]

{ #category : 'accessing' }
Dirac >> filter: anObject [

	filter := anObject
]

{ #category : 'accessing' }
Dirac >> generator [

	^ generator
]

{ #category : 'accessing' }
Dirac >> generator: anObject [

	generator := anObject
]

{ #category : 'initialization' }
Dirac >> initialize [

	| envelope sine |
	generator := Pulsen new
		             length: (1 / 44100) asBox;
		             period:
			             (PhHSlider new
				              label: 'DiracPeriod'
				              values: #( 1 0.05 1 0.001 )).
	envelope := AREnv new
		            trigger: generator;
		            attack: 0 asBox;
		            release: 0.14 asBox.
	sine := SineOsc new
		        label: 'DiracBass';
		        freq: #( 46 30 70 1 ).
	bass := sine => envelope.
	filter := ResonHp new label: 'Dirac'
]
