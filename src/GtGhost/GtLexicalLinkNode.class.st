Class {
	#name : #GtLexicalLinkNode,
	#superclass : #GtLexicalElementNode,
	#instVars : [
		'url',
		'rel',
		'target',
		'title'
	],
	#category : #'GtGhost-Lexical'
}

{ #category : #'as yet unclassified' }
GtLexicalLinkNode >> initialize [ 
	super initialize.
	type := 'link'.
	url := ''
]

{ #category : #'as yet unclassified' }
GtLexicalLinkNode >> initializeFromDict: aDictionary [ 
	super initializeFromDict: aDictionary.
	url := aDictionary at: 'url' ifAbsent: [ '' ].
	rel := aDictionary at: 'rel' ifAbsent: [ nil ].
	target := aDictionary at: 'target' ifAbsent: [ nil ].
	title := aDictionary at: 'title' ifAbsent: [ nil ]
]

{ #category : #accessing }
GtLexicalLinkNode >> rel [
	^ rel
]

{ #category : #accessing }
GtLexicalLinkNode >> rel: anObject [
	rel := anObject
]

{ #category : #'as yet unclassified' }
GtLexicalLinkNode >> stonFields [ 
	^ super stonFields
		add: #url -> url;
		addIfNotNil: #rel -> rel;
		addIfNotNil: #target -> target;
		addIfNotNil: #title -> title;
		yourself
]

{ #category : #accessing }
GtLexicalLinkNode >> target [
	^ target
]

{ #category : #accessing }
GtLexicalLinkNode >> target: anObject [
	target := anObject
]

{ #category : #accessing }
GtLexicalLinkNode >> title [
	^ title
]

{ #category : #accessing }
GtLexicalLinkNode >> title: anObject [
	title := anObject
]

{ #category : #accessing }
GtLexicalLinkNode >> url [
	^ url
]

{ #category : #accessing }
GtLexicalLinkNode >> url: anObject [
	url := anObject
]
