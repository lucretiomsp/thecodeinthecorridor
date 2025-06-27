"
Special NcSPace for ESUG perrformance
"
Class {
	#name : 'CorridorSpace',
	#superclass : 'NcSpace',
	#instVars : [
		'diracs',
		'kickBall',
		'rect1',
		'rect2',
		'rect3',
		'hats'
	],
	#category : 'CodeInTheCorridor-Graphic',
	#package : 'CodeInTheCorridor',
	#tag : 'Graphic'
}

{ #category : 'accessing' }
CorridorSpace >> diracs [

^ diracs
]

{ #category : 'as yet unclassified' }
CorridorSpace >> diracsWIdth: anInteger [



self rect1 width: anInteger.
self rect2 width: anInteger.
self rect3 width: anInteger.
]

{ #category : 'accessing' }
CorridorSpace >> hats [

^ hats
]

{ #category : 'as yet unclassified' }
CorridorSpace >> hatsSize: aPoint [

self hats children do: [ :h | h size: aPoint ]
]

{ #category : 'initialization' }
CorridorSpace >> initialize [ 

super initialize .
self initializeRects .
self initializeHiHats.
kickBall := (NcCircle new background: Color red) position: self centerCoordinates .

self root addChild: hats; addChild: rect1; addChild: rect2; addChild: rect3; addChild: kickBall .

]

{ #category : 'initialization' }
CorridorSpace >> initializeHiHats [

| insets |
insets := BlInsets all: 4.
hats := BlElement new background: Color transparent; layout: BlLinearLayout horizontal; size: 600@ 100 .
(1 to: 8) do:  [:i | hats addChild: 
	((BlElement  new background:Color blue lighter ) margin: insets ; padding: insets)].

]

{ #category : 'initialization' }
CorridorSpace >> initializeRects [

rect1 := NcRect new position: 0@100.
rect2 := NcRect new position: 0@300.
rect3 := NcRect new position: 0@500.
]

{ #category : 'accessing' }
CorridorSpace >> kickBall [

	^ kickBall
]

{ #category : 'accessing' }
CorridorSpace >> rect1 [

	^ rect1
]

{ #category : 'accessing' }
CorridorSpace >> rect2 [

	^ rect2
]

{ #category : 'accessing' }
CorridorSpace >> rect3 [

	^ rect3
]
