Class {
	#name : #ReversalCard,
	#superclass : #Object,
	#instVars : [
		'typeOfCard'
	],
	#classInstVars : [
		'spaceship',
		'boardPosition',
		'typeOfCard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #playing }
ReversalCard class >> addTo: anOutstandingSpaceshipsGame [

	anOutstandingSpaceshipsGame addAffecting:
		(SpaceshipCardHolder of: spaceship holding: self create)
]

{ #category : #playing }
ReversalCard class >> cancelIn: anOutstandingSpaceshipsGame [ 
	"Invertir el casillero"
	anOutstandingSpaceshipsGame invert: boardPosition.
	"Cancelar"
	anOutstandingSpaceshipsGame cancel: self create affecting: boardPosition.
]

{ #category : #'instance creation' }
ReversalCard class >> create [

	^ self new initializeAs: PermanentCard new
]

{ #category : #playing }
ReversalCard class >> incorporateTo: anOutstandingSpaceshipsGame [

	| currentSpaceshipPlaying spaceshipBoardPosition |
	currentSpaceshipPlaying := anOutstandingSpaceshipsGame
		                           spaceshipPlaying.
	spaceshipBoardPosition := (anOutstandingSpaceshipsGame positionOf:
		                           currentSpaceshipPlaying) boardPosition.
	anOutstandingSpaceshipsGame invert: spaceshipBoardPosition position.
	spaceship := spaceshipBoardPosition position.
	PermanentCard new incorporate: self to: anOutstandingSpaceshipsGame
]

{ #category : #'class initialization' }
ReversalCard class >> thrownAt: aBoardPosition [

	boardPosition := aBoardPosition position.
	typeOfCard := InstantaneousCard
]

{ #category : #comparing }
ReversalCard >> = aCard [

	^ self class = aCard
]

{ #category : #asserting }
ReversalCard >> assertItIsThrowableIfCurrentTurnBelongingToSpaceshipIs: anAssertion [

	typeOfCard canBeThrownWithCurrentTurn: anAssertion
]

{ #category : #asserting }
ReversalCard >> assertItIsThrowableInTurn: anAssertion in: anOutstandingSpaceshipsGame [

	self assertItIsThrowableIfCurrentTurnBelongingToSpaceshipIs:
		anAssertion
]

{ #category : #initialization }
ReversalCard >> initializeAs: aTypeOfCard [

	typeOfCard := aTypeOfCard
]

{ #category : #accessing }
ReversalCard >> name [

	^ 'Reversal'
]

{ #category : #accessing }
ReversalCard >> typeOfCard [

	^ typeOfCard name
]
