"
Single sample pulse 
"
Class {
	#name : 'Dirac',
	#superclass : 'PhBox',
	#instVars : [
		'generator',
		'filter'
	],
	#category : 'CodeInTheCorridor-Instruments',
	#package : 'CodeInTheCorridor',
	#tag : 'Instruments'
}

{ #category : 'initialization' }
Dirac >> asBox [ 

^ (self generator => self filter) asBox
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

	generator := Pulsen new
		             length: (1 / 44100) asBox;
		             period:
			             (PhHSlider new
				              label: 'DiracPeriod'
				              values: #( 0.32 0.01 1 0.01 )).
	filter := ResonHp new label: 'Dirac'
]
