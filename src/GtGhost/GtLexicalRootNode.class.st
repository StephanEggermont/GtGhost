Class {
	#name : #GtLexicalRootNode,
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
GtLexicalRootNode >> children [
	^ children
]

{ #category : #accessing }
GtLexicalRootNode >> children: anObject [
	children := anObject
]

{ #category : #accessing }
GtLexicalRootNode >> direction [
	^ direction
]

{ #category : #accessing }
GtLexicalRootNode >> direction: anObject [
	direction := anObject
]

{ #category : #accessing }
GtLexicalRootNode >> format [
	^ format
]

{ #category : #accessing }
GtLexicalRootNode >> format: anObject [
	format := anObject
]

{ #category : #accessing }
GtLexicalRootNode >> indent [
	^ indent
]

{ #category : #accessing }
GtLexicalRootNode >> indent: anObject [
	indent := anObject
]

{ #category : #'as yet unclassified' }
GtLexicalRootNode >> initializeFromDict: aDictionary [ 
	super initializeFromDict: aDictionary.
	direction := aDictionary at: 'direction' ifAbsent: [ nil ].
	format := aDictionary at: 'format' ifAbsent: [ 0 ].
	indent := aDictionary at: 'indent' ifAbsent: [ 0 ].
	children := (aDictionary at: 'children' ifAbsent: [ #() ]) 
		collect: [ :childDict | GtLexicalNode fromJsonDict: childDict ]
]

{ #category : #'as yet unclassified' }
GtLexicalRootNode >> nitialize [ 
	super initialize.
	type := 'root'.
	children := OrderedCollection new.
	direction := nil.
	format := 0.
	indent := 0
]

{ #category : #'as yet unclassified' }
GtLexicalRootNode >> stonFields [ 
	^ super stonFields
		add: #children -> children;
		add: #direction -> direction;
		add: #format -> format;
		add: #indent -> indent;
		yourself
]
