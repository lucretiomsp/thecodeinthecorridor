Class {
	#name : 'MainHandler',
	#superclass : 'MpHandler',
	#instVars : [
		'space'
	],
	#category : 'CodeInTheCorridor-MethodProxies',
	#package : 'CodeInTheCorridor',
	#tag : 'MethodProxies'
}

{ #category : 'evaluating' }
MainHandler >> afterMethod [ 

| rndColor |
rndColor := Color random .

self space root background: rndColor.
self space snare backgroundColor: rndColor

]

{ #category : 'initialization' }
MainHandler >> initialize [ 
super initialize 
]

{ #category : 'accessing' }
MainHandler >> space [

	^ space
]

{ #category : 'accessing' }
MainHandler >> space: aSpace [

	space := aSpace
]
