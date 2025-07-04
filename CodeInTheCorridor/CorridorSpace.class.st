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
		'hats',
		'snare',
		'notes',
		'captureContainer'
	],
	#classInstVars : [
		'snareIcon'
	],
	#category : 'CodeInTheCorridor-Graphic',
	#package : 'CodeInTheCorridor',
	#tag : 'Graphic'
}

{ #category : 'adding' }
CorridorSpace >> addNotesNumberFromString: aString [

| collection entries |
collection  := aString  findBetweenSubstrings: ','.
entries := collection collect: [ :c | BlTextElement new text: ((c asString , ' ' )asRopedText foreground: Color orange; fontSize: 29) ].

self notes  addChildren: entries.
]

{ #category : 'accessing' }
CorridorSpace >> captureContainer [ 

^ captureContainer 
]

{ #category : 'resizer' }
CorridorSpace >> captureSize: aNumber [

self captureContainer transformDo: [ :t | t scaleBy: aNumber * 4]
]

{ #category : 'accessing' }
CorridorSpace >> diracs [

^ diracs
]

{ #category : 'resizer' }
CorridorSpace >> diracsWIdth: anInteger [



self rect1 width: anInteger.
self rect2 width: anInteger.
self rect3 width: anInteger.
]

{ #category : 'accessing' }
CorridorSpace >> hats [

^ hats
]

{ #category : 'resizer' }
CorridorSpace >> hatsSize: aPoint [

self hats children do: [ :h | h size: aPoint ]
]

{ #category : 'initialization' }
CorridorSpace >> initialize [ 

super initialize .
self initializeRects .
self initializeHiHats.
self initializeNotesContainer .
self initializeCapture .

kickBall := (NcCircle new background: Color red) position: self centerCoordinates .
snare := ICBassDrumIcon  new.

self root addChild: notes;   addChild: hats; addChild: rect1; addChild: rect2; addChild: rect3; addChild: kickBall.
self root addChild: snare .
self root addChild: captureContainer .

]

{ #category : 'initialization' }
CorridorSpace >> initializeCapture [

captureContainer := BlElement new background: Color transparent; size: 300@500.
1 to: 32 do: [ :i | captureContainer addChild: (NcCircle new  diameter: 10; position: (Random new nextIntegerBetween: 10 and: 380 )@ (Random new nextIntegerBetween: 10 and: 300 ) )].

]

{ #category : 'initialization' }
CorridorSpace >> initializeHiHats [

| insets |
insets := BlInsets all: 4.
hats := BlElement new background: Color transparent; layout: BlLinearLayout horizontal; size: 600@ 100; position: 200@540 .
(1 to: 8) do:  [:i | hats addChild: 
	((BlElement  new background:Color blue lighter ) margin: insets ; padding: insets)].

]

{ #category : 'initialization' }
CorridorSpace >> initializeNotesContainer [

notes := BlElement new background: Color transparent ; 
layout: (BlGridLayout new columnCount: 3);
size: 400@400;
position: 0@360
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
CorridorSpace >> notes [

^ notes
]

{ #category : 'resizer' }
CorridorSpace >> notesSize: aPoint [

self notes children do: [ :n | n size: aPoint ]
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

{ #category : 'removing' }
CorridorSpace >> removeNotes [

self root removeChild: notes
]

{ #category : 'instance creation' }
CorridorSpace >> rotate: aDegree [

self root  children do: [:c | c transformDo: [ :t | t rotateBy: aDegree ]]
]

{ #category : 'accessing' }
CorridorSpace >> snare [

^ snare
]

{ #category : 'resizer' }
CorridorSpace >> snareSize: aPoint [

self snare size: aPoint 
]
