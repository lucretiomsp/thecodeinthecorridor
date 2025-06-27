Class {
	#name : 'SeqSoloHandler',
	#superclass : 'MpHandler',
	#instVars : [
		'space'
	],
	#category : 'CodeInTheCorridor-MethodProxies',
	#package : 'CodeInTheCorridor',
	#tag : 'MethodProxies'
}

{ #category : 'evaluating' }
SeqSoloHandler >> afterMethod [ 

self space root background: Color white 
]

{ #category : 'initialization' }
SeqSoloHandler >> initialize [ 

super initialize 
]

{ #category : 'accessing' }
SeqSoloHandler >> space [

	^ space
]

{ #category : 'accessing' }
SeqSoloHandler >> space: aSpace [

	space := aSpace
]
