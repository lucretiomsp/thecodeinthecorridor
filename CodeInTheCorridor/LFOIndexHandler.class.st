Class {
	#name : 'LFOIndexHandler',
	#superclass : 'MpHandler',
	#instVars : [
		'space'
	],
	#category : 'CodeInTheCorridor-MethodProxies',
	#package : 'CodeInTheCorridor',
	#tag : 'MethodProxies'
}

{ #category : 'evaluating' }
LFOIndexHandler >> afterMethod [ 

self space root background: Color random
]

{ #category : 'initialization' }
LFOIndexHandler >> initialize [ 
super initialize 
]

{ #category : 'accessing' }
LFOIndexHandler >> space [

	^ space
]

{ #category : 'accessing' }
LFOIndexHandler >> space: aSpace [

	space := aSpace
]
