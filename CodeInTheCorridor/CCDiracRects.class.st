"
3 NcRects connected to the amplitude signal of the Dirac
"
Class {
	#name : 'CCDiracRects',
	#superclass : 'BlElement',
	#instVars : [
		'rect1',
		'rect2',
		'rect3'
	],
	#category : 'CodeInTheCorridor-Graphic',
	#package : 'CodeInTheCorridor',
	#tag : 'Graphic'
}

{ #category : 'initialization' }
CCDiracRects >> initialize [

	super initialize.
	self initializeRects.
	self
		addChild: rect1;
		addChild: rect2;
		addChild: rect3.
	self background: Color red.
	self size: NcSpace extent
]

{ #category : 'initialization' }
CCDiracRects >> initializeRects [

rect1 := NcRect new position: 0@100.
rect2 := NcRect new position: 0@300.
rect3 := NcRect new position: 0@500.
]
