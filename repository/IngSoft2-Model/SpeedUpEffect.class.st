Class {
	#name : #SpeedUpEffect,
	#superclass : #Object,
	#instVars : [
		'displacement'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
SpeedUpEffect class >> create [

	^ self new create.
]

{ #category : #effects }
SpeedUpEffect >> applyEffectOn: aBoard [

	^ self effectOnPosition
]

{ #category : #effects }
SpeedUpEffect >> applyEffectTo: aSpaceship on: aBoard [

	^ self applyEffectOn: aBoard
]

{ #category : #initialization }
SpeedUpEffect >> create [

	displacement := 4
]

{ #category : #effects }
SpeedUpEffect >> effectOnPosition [

	^ displacement
]

{ #category : #effects }
SpeedUpEffect >> reApplyEffectTo: aSpaceship on: aBoard [ 

	aBoard 
		movePlayingSpaceshipAt: (aBoard positionOf: aSpaceship)
		by: (self applyEffectTo: aSpaceship on: aBoard).
]

{ #category : #effects }
SpeedUpEffect >> reverseEffect [

	displacement := displacement * -1
]

{ #category : #accessing }
SpeedUpEffect >> typeOfEffect [

	^ 'Speedup'
]
