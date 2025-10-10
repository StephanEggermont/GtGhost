Class {
	#name : #GtLexicalListNode,
	#superclass : #GtLexicalElementNode,
	#instVars : [
		'listType',
		'start',
		'tag'
	],
	#category : #'GtGhost-Lexical'
}

{ #category : #'as yet unclassified' }
GtLexicalListNode >> initialize [ 
	super initialize.
	type := 'list'.
	listType := 'bullet'.
	start := 1.
	tag := 'ul'
]

{ #category : #'as yet unclassified' }
GtLexicalListNode >> initializeFromDict: aDictionary [ 
	super initializeFromDict: aDictionary.
	listType := aDictionary at: 'listType' ifAbsent: [ 'bullet' ].
	start := aDictionary at: 'start' ifAbsent: [ 1 ].
	tag := aDictionary at: 'tag' ifAbsent: [ 'ul' ]
]

{ #category : #accessing }
GtLexicalListNode >> listType [
	^ listType
]

{ #category : #accessing }
GtLexicalListNode >> listType: anObject [
	listType := anObject
]

{ #category : #accessing }
GtLexicalListNode >> start [
	^ start
]

{ #category : #accessing }
GtLexicalListNode >> start: anObject [
	start := anObject
]

{ #category : #'as yet unclassified' }
GtLexicalListNode >> stonFields [ 
	^ super stonFields
		add: #listType -> listType;
		add: #start -> start;
		add: #tag -> tag;
		yourself
]

{ #category : #accessing }
GtLexicalListNode >> tag [
	^ tag
]

{ #category : #accessing }
GtLexicalListNode >> tag: anObject [
	tag := anObject
]
