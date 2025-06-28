"
TurboPhausto subclass loading different instruments
"
Class {
	#name : 'Corridor',
	#superclass : 'TurboPhausto',
	#instVars : [
		'kick',
		'snare',
		'hat',
		'conga',
		'axis1',
		'axis2',
		'diracContainer',
		'captureContainer'
	],
	#category : 'CodeInTheCorridor',
	#package : 'CodeInTheCorridor'
}

{ #category : 'loading' }
Corridor class >> loadAllSamplers [

	| kick snare hat conga pad hh |
	kick := TpSampler new
		        label: 'kick';
		        index: 0 asBox;
		        pathToFile:
			        '/Users/domenicocipriani/MyStuff/samples/California-Drums-Studio-City/Kicks/B-Kick3Nine.wav '.
	snare := TpSampler new
		         label: 'snare';
		index: 0 asBox;
		         pathToFile:
			         '/Users/domenicocipriani/MyStuff/samples/California-Drums-Studio-City/Snares/Su-Snr3.wav'.
	hat := TpSampler new
		       label: 'hat';
		       index: 0 asBox;
		       pathToFile:
			       '/Users/domenicocipriani/MyStuff/samples/California-Drums-Studio-City/Hats/JS-Hat6.wav'.
	conga := TpSampler new
		         label: 'conga';
		         pathToFolder:
			         '/Users/domenicocipriani/Documents/TurboSamples/conga'.
	pad := TpSampler new
		       label: 'pad';
		       index: 0 asBox;
		       pathToFile:
			       '/Users/domenicocipriani/Documents/MoofLodSamples/23_PadJunglAmb.wav'.

	hh := TpSampler new
		      label: 'hh';
		      index: 0 asBox;
		      pathToFile:
			      '/Users/domenicocipriani/MyStuff/samples/California-Drums-Studio-City/Hats/H-CH.wav'.

	allSamplers := {
		               kick => PhHBarGraph new label: 'kick'.
		               snare => PhHBarGraph new label: 'snare'.
		               hat.
		               conga.
		               pad.
		               hh => PhHBarGraph new label: 'hh' }
]

{ #category : 'loading' }
Corridor class >> loadAllSynths [
	"load all TurboSynths - kept empty for now"

	| reese psg |
	reese := TpReese new
		         sustain: 0.2 asBox;
		         attack: 0.01 asBox;
		         decay: 0.2 asBox.
	psg := PsgPlus new
		       attack: 0.01 asBox;
		       decay: 0.25 asBox;
		       sustain: 0.3 asBox;
		       release: 0.19 asBox; dsfreq: 180 asBox ; q: 4 asBox.
	allSynths := {
		             PhCapture new => PhHBarGraph new label: 'captured'.
		             PhLooper new.
		             reese.
		             Dirac new => PhHBarGraph new label: 'dirac'.
		             psg  => PhHBarGraph new label: 'psg'}.

	^ self
]

{ #category : 'loading' }
Corridor class >> loadRack [
	"load the chain of synthesizers, effects and filter which become the TurboPhausto dsp"

	rack := self allInstruments asSumOfUGen
]

{ #category : 'accessing' }
Corridor >> axis1 [ 
^ axis1
]

{ #category : 'accessing' }
Corridor >> axis2 [

	^ axis2
]

{ #category : 'accessing' }
Corridor >> captureContainer [

	^ captureContainer 
]

{ #category : 'accessing' }
Corridor >> diracContainer [

	^ diracContainer
]

{ #category : 'ui building' }
Corridor >> displayMinimalUI [

	| space |
	self initializeAxisControls.
	self initializeCaptureControls.


	space := BlSpace new.
	space extent: 720 @ 500.
	space root
		background: Color black;
		layout: (BlGridLayout new columnCount: 1).

	space root
		addChild: self diracContainer;
		addChild: self captureContainer.

	space useMorphicHost; show
]

{ #category : 'ui building' }
Corridor >> initializeAxisControls [
	"axis1"

	| size insets paramDic |
	insets := BlInsets all: 16.
	paramDic := self class tpDsp getUIItemsLabeledDictionary.
	diracContainer := BlElement new
		                  background: Color red darker;
		                  layout: BlLinearLayout horizontal;
		                  size: 1000 @ 240.
	size := 280 @ 140.
	axis1 := ICAxis new widgetSize: size.
	axis1 minX: 0.01.
	axis1 maxX: 1.
	axis1 minY: 25.
	axis1 maxY: 20000.
	axis1 xLabel: 'DiracPeriod'.
	axis1 yLabel: 'DiracCutoff'.
	axis1 arrowColor: Color white.
	axis1 backgroundColor: Color darkGray.
	axis1 cursorSize: 12.
	axis1 callBack: [ :x :y |
			self class tpDsp
				setValue: x parameter: 'DiracPeriod';
				setValue: y parameter: 'DiracFrequency' ].
	axis1 position: 50 asPoint.
	axis1 transformDo: [ :t | t translateBy: 30 @ 0 ].


	"axis2"
	axis2 := ICAxis new widgetSize: size.
	axis2 minX: 46.
	axis2 maxX: 70.
	axis2 minY: 25.
	axis2 maxY: 0.
	axis2 xLabel: 'DiracBassLevel'.
	axis2 yLabel: 'DiracBassFreq'.
	axis2 arrowColor: Color white.
	axis2 backgroundColor: Color darkGray.
	axis2 cursorSize: 12.
	axis2 cursorColor: Color red.
	axis2 callBack: [ :x :y |
			self class tpDsp
				setValue: x parameter: 'DiracBassFreq';
				setValue: y parameter: 'DiracBassULevel' ].
	axis2 position: 50 asPoint.
	axis2 transformDo: [ :t | t translateBy: 30 @ 0 ].

	diracContainer
		addChild: (self axis1
				 margin: insets;
				 padding: insets);
		addChild: (self axis2
				 margin: insets;
				 padding: insets).
	diracContainer addChild: ((ICMixerSlider new
			  fromDictionary: (paramDic at: #DiracuLevel)
			  forDsp: self class tpDsp)
			 margin: insets;
			 padding: insets)
]

{ #category : 'ui building' }
Corridor >> initializeCaptureControls [

	| size insets paramDic captureButton captureLevel |
	insets := BlInsets all: 16.
	paramDic := self class tpDsp getUIItemsLabeledDictionary.
	captureContainer := BlElement new
		                    background: Color black;
		                    layout: BlLinearLayout horizontal;
		                    size: 1000 @ 300.
	captureLevel := ICMixerSlider new
		                fromDictionary: (paramDic at: #CaptureuLevel)
		                forDsp: self class tpDsp.
	captureButton := ICLabelButton new
		                 fromDictionary:( paramDic at: #Capture)
		                 forDsp: self class tpDsp.

	captureContainer
		addChild: (captureLevel
				 margin: insets;
				 padding: insets);
		addChild: (captureButton
				 margin: insets;
				 padding: insets)
]
