Class {
	#name : 'SeqToPerfHandler2',
	#superclass : 'MpHandler',
	#instVars : [
		'space'
	],
	#category : 'CodeInTheCorridor-MethodProxies',
	#package : 'CodeInTheCorridor',
	#tag : 'MethodProxies'
}

{ #category : 'evaluating' }
SeqToPerfHandler2 >> afterExecutionWithReceiver: anObject arguments: anArrayOfObjects returnValue: aReturnValue [

Transcript show: anObject asString ; cr

]

{ #category : 'accessing' }
SeqToPerfHandler2 >> space [ 
^ space
]

{ #category : 'accessing' }
SeqToPerfHandler2 >> space: aSpace [

	space := aSpace
]
