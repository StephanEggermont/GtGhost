Class {
	#name : #GtLexicalNode,
	#superclass : #Object,
	#instVars : [
		'type',
		'version'
	],
	#category : #'GtGhost-Lexical'
}

{ #category : #'as yet unclassified' }
GtLexicalNode class >> fromJsonDict: aDictionary [ 
	"Create a node from a dictionary, dispatching to correct subclass"
	| nodeType nodeClass |
	nodeType := aDictionary at: 'type'.
	nodeClass := self nodeClassForType: nodeType.
	^ nodeClass new initializeFromDict: aDictionary
]

{ #category : #'as yet unclassified' }
GtLexicalNode class >> fromSton: stonReader [ 
	| node |
	node := self new.
	stonReader parseMapDo: [ :key :value |
		key = 'type' ifTrue: [ node type: value ].
		key = 'version' ifTrue: [ node version: value ] ].
	^ node
]

{ #category : #'as yet unclassified' }
GtLexicalNode class >> nodeClassForType: aString [ 
	"Map node types to classes"
	^ (Dictionary new
		at: 'root' put: GtLexicalRootNode;
		at: 'paragraph' put: GtLexicalParagraphNode;
		at: 'heading' put: GtLexicalHeadingNode;
		at: 'text' put: GtLexicalTextNode;
		at: 'linebreak' put: GtLexicalLineBreakNode;
		at: 'link' put: GtLexicalLinkNode;
		at: 'list' put: GtLexicalListNode;
		at: 'listitem' put: GtLexicalListItemNode;
		at: 'quote' put: GtLexicalQuoteNode;
		at: 'code' put: GtLexicalCodeNode;
		yourself) at: aString ifAbsent: [ GtLexicalElementNode ]
]

{ #category : #'as yet unclassified' }
GtLexicalNode >> fieldCollection [
	^ GtLexicalOrderedCollection new
]

{ #category : #'as yet unclassified' }
GtLexicalNode >> initialize [
	version := 1
]

{ #category : #'as yet unclassified' }
GtLexicalNode >> initializeFromDict: aDictionary [ 
	"Subclasses override to populate from dictionary"
	type := aDictionary at: 'type'.
	version := aDictionary at: 'version' ifAbsent: [ 1 ]
]

{ #category : #'as yet unclassified' }
GtLexicalNode >> stonFields [
	"Return ordered collection of field associations for STON"

	^ self fieldCollection
		add: #type -> type;
		add: #version -> version;
		yourself
]

{ #category : #'as yet unclassified' }
GtLexicalNode >> stonOn: stonWriter [
	stonWriter writeObject: self listSingleton: self stonFields
]

{ #category : #accessing }
GtLexicalNode >> type [
	^ type
]

{ #category : #accessing }
GtLexicalNode >> type: anObject [
	type := anObject
]

{ #category : #accessing }
GtLexicalNode >> version [
	^ version
]

{ #category : #accessing }
GtLexicalNode >> version: anObject [
	version := anObject
]
