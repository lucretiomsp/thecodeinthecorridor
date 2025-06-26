Class {
	#name : 'SeqMuteHandler',
	#superclass : 'MpHandler',
	#instVars : [
		'space'
	],
	#category : 'CodeInTheCorridor-MethodProxies',
	#package : 'CodeInTheCorridor',
	#tag : 'MethodProxies'
}

{ #category : 'evaluating' }
SeqMuteHandler >> afterMethod [ 

self space root background: Color white 
]

{ #category : 'initialization' }
SeqMuteHandler >> initialize [ 

super initialize 
]

{ #category : 'accessing' }
SeqMuteHandler >> space [

	^ space
]

{ #category : 'accessing' }
SeqMuteHandler >> space: aSpace [

	space := aSpace
]
