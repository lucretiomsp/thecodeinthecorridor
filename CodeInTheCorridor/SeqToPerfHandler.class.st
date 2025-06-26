"
MethodProxies handling to: message for Sequencer
"
Class {
	#name : 'SeqToPerfHandler',
	#superclass : 'MpHandler',
	#instVars : [
		'space'
	],
	#category : 'CodeInTheCorridor-MethodProxies',
	#package : 'CodeInTheCorridor',
	#tag : 'MethodProxies'
}

{ #category : 'evaluating' }
SeqToPerfHandler >> afterMethod [ 

self space root background: Color random
]

{ #category : 'initialization' }
SeqToPerfHandler >> initialize [ 
super initialize 
]

{ #category : 'accessing' }
SeqToPerfHandler >> space [

	^ space
]

{ #category : 'accessing' }
SeqToPerfHandler >> space: aSpace [

	space := aSpace
]
