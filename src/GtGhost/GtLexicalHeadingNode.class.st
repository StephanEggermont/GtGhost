Class {
	#name : #GtLexicalHeadingNode,
	#superclass : #GtLexicalElementNode,
	#instVars : [
		'tag'
	],
	#category : #'GtGhost-Lexical'
}

{ #category : #'as yet unclassified' }
GtLexicalHeadingNode >> initialize [ 
	super initialize.
	type := 'heading'.
	tag := 'h1'
]

{ #category : #'as yet unclassified' }
GtLexicalHeadingNode >> initializeFromDict: aDictionary [ 
	super initializeFromDict: aDictionary.
	tag := aDictionary at: 'tag' ifAbsent: [ 'h1' ]
]

{ #category : #'as yet unclassified' }
GtLexicalHeadingNode >> stonFields [ 
	^ super stonFields 
		add: #tag -> tag; 
		yourself
]

{ #category : #accessing }
GtLexicalHeadingNode >> tag [
	^ tag
]

{ #category : #accessing }
GtLexicalHeadingNode >> tag: anObject [
	tag := anObject
]
