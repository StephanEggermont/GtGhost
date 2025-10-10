Class {
	#name : #GtLexicalElementNode,
	#superclass : #GtLexicalNode,
	#instVars : [
		'children',
		'direction',
		'format',
		'indent'
	],
	#category : #'GtGhost-Lexical'
}

{ #category : #accessing }
GtLexicalElementNode >> children [
	^ children
]

{ #category : #accessing }
GtLexicalElementNode >> children: anObject [
	children := anObject
]

{ #category : #accessing }
GtLexicalElementNode >> direction [
	^ direction
]

{ #category : #accessing }
GtLexicalElementNode >> direction: anObject [
	direction := anObject
]

{ #category : #accessing }
GtLexicalElementNode >> format [
	^ format
]

{ #category : #accessing }
GtLexicalElementNode >> format: anObject [
	format := anObject
]

{ #category : #accessing }
GtLexicalElementNode >> indent [
	^ indent
]

{ #category : #accessing }
GtLexicalElementNode >> indent: anObject [
	indent := anObject
]

{ #category : #'as yet unclassified' }
GtLexicalElementNode >> initialize [ 
	super initialize.
	children := OrderedCollection new.
	direction := nil.
	format := 0.
	indent := 0
]

{ #category : #'as yet unclassified' }
GtLexicalElementNode >> initializeFromDict: aDictionary [ 
	super initializeFromDict: aDictionary.
	direction := aDictionary at: 'direction' ifAbsent: [ nil ].
	format := aDictionary at: 'format' ifAbsent: [ 0 ].
	indent := aDictionary at: 'indent' ifAbsent: [ 0 ].
	children := (aDictionary at: 'children' ifAbsent: [ #() ])
		collect: [ :childDict | GtLexicalNode fromJsonDict: childDict ]
]

{ #category : #'as yet unclassified' }
GtLexicalElementNode >> stonFields [ 
	^ super stonFields
		add: #children -> children;
		addIfNotNil: #direction -> direction;
		add: #format -> format;
		add: #indent -> indent;
		yourself
]
