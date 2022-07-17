Class {
	#name : #SpaceshipCardHolder,
	#superclass : #Object,
	#instVars : [
		'card',
		'owner'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
SpaceshipCardHolder class >> of: theOwner holding: aCard [

	^ self new of: theOwner holding: aCard
]

{ #category : #accessing }
SpaceshipCardHolder >> card [

	^ card
]

{ #category : #accessing }
SpaceshipCardHolder >> effectOnThrow [

	^ card effectOnThrow
]

{ #category : #initialization }
SpaceshipCardHolder >> of: theOwner holding: aCard [

	owner := theOwner.
	card := aCard
]

{ #category : #accessing }
SpaceshipCardHolder >> owner [

	^ owner
]
