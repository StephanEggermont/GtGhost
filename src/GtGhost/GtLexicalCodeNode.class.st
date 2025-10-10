Class {
	#name : #GtLexicalCodeNode,
	#superclass : #GtLexicalElementNode,
	#instVars : [
		'language'
	],
	#category : #'GtGhost-Lexical'
}

{ #category : #'as yet unclassified' }
GtLexicalCodeNode >> initialize [ 
	super initialize.
	type := 'code'
]

{ #category : #'as yet unclassified' }
GtLexicalCodeNode >> initializeFromDict: aDictionary [ 
	super initializeFromDict: aDictionary.
	language := aDictionary at: 'language' ifAbsent: [ nil ]
]

{ #category : #accessing }
GtLexicalCodeNode >> language [
	^ language
]

{ #category : #accessing }
GtLexicalCodeNode >> language: anObject [
	language := anObject
]

{ #category : #'as yet unclassified' }
GtLexicalCodeNode >> stonFields [
	^super stonFields
		addIfNotNil: #language -> language
]
