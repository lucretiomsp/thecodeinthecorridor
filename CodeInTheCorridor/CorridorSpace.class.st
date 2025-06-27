"
Special NcSPace for ESUG perrformance
"
Class {
	#name : 'CorridorSpace',
	#superclass : 'NcSpace',
	#instVars : [
		'diracs'
	],
	#category : 'CodeInTheCorridor-Graphic',
	#package : 'CodeInTheCorridor',
	#tag : 'Graphic'
}

{ #category : 'accessing' }
CorridorSpace >> diracs [

^ diracs
]

{ #category : 'initialization' }
CorridorSpace >> initialize [ 

super initialize .
diracs := CCDiracRects new.

self root addChild: diracs.
]
