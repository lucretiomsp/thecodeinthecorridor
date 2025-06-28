Class {
	#name : 'NotesHandler',
	#superclass : 'MpHandler',
	#instVars : [
		'space'
	],
	#category : 'CodeInTheCorridor-MethodProxies',
	#package : 'CodeInTheCorridor',
	#tag : 'MethodProxies'
}

{ #category : 'initialization' }
NotesHandler >> initialize [ 

super initialize 
]

{ #category : 'initialization' }
NotesHandler >> space [ 

^ space
]

{ #category : 'initialization' }
NotesHandler >> space: aCorridorSpace [

space := aCorridorSpace 
]
