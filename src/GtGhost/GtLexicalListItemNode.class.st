Class {
	#name : #GtLexicalListItemNode,
	#superclass : #GtLexicalElementNode,
	#instVars : [
		'itemValue',
		'checked'
	],
	#category : #'GtGhost-Lexical'
}

{ #category : #accessing }
GtLexicalListItemNode >> checked [
	^ checked
]

{ #category : #accessing }
GtLexicalListItemNode >> checked: anObject [
	checked := anObject
]

{ #category : #'as yet unclassified' }
GtLexicalListItemNode >> initialize [ 
	super initialize.
	type := 'listitem'.
	itemValue := 1
]

{ #category : #'as yet unclassified' }
GtLexicalListItemNode >> initializeFromDict: aDictionary [ 
	super initializeFromDict: aDictionary.
	itemValue := aDictionary at: 'value' ifAbsent: [ 1 ].
	checked := aDictionary at: 'checked' ifAbsent: [ nil ]
]

{ #category : #accessing }
GtLexicalListItemNode >> itemValue [
	^ itemValue
]

{ #category : #accessing }
GtLexicalListItemNode >> itemValue: anObject [
	itemValue := anObject
]

{ #category : #'as yet unclassified' }
GtLexicalListItemNode >> stonFields [ 
	^super stonFields 
		add: #value -> itemValue;
		addIfNotNil: #checked -> checked 
]
