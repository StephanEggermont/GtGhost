Class {
	#name : #GtLexicalDocumentBuilder,
	#superclass : #Object,
	#instVars : [
		'editorState',
		'currentNode'
	],
	#category : #'GtGhost-Lexical'
}

{ #category : #'as yet unclassified' }
GtLexicalDocumentBuilder >> boldText: aString [ 
	| text |
	text := GtLexicalTextNode new.
	text text: aString.
	text setBold
	currentNode children add: text.
	^ self
]

{ #category : #'as yet unclassified' }
GtLexicalDocumentBuilder >> build [
	^editorState
]

{ #category : #'as yet unclassified' }
GtLexicalDocumentBuilder >> buildJsonString [ 
	^ editorState asJsonString
]

{ #category : #accessing }
GtLexicalDocumentBuilder >> currentNode [
	^ currentNode
]

{ #category : #accessing }
GtLexicalDocumentBuilder >> currentNode: anObject [
	currentNode := anObject
]

{ #category : #accessing }
GtLexicalDocumentBuilder >> editorState [
	^ editorState
]

{ #category : #accessing }
GtLexicalDocumentBuilder >> editorState: anObject [
	editorState := anObject
]

{ #category : #'as yet unclassified' }
GtLexicalDocumentBuilder >> heading: aString level: anInteger [ 
	| heading text |
	heading := GtLexicalHeadingNode new.
	heading tag: 'h', anInteger asString.
	
	text := GtLexicalTextNode new.
	text text: aString.
	heading children add: text.
	
	currentNode children add: heading.
	^ self
]

{ #category : #'as yet unclassified' }
GtLexicalDocumentBuilder >> initialize [ 
	super initialize.
	editorState := GtLexicalEditorState new.
	currentNode := editorState root
]

{ #category : #'as yet unclassified' }
GtLexicalDocumentBuilder >> italicText: aString [ 
	| text |
	text := GtLexicalTextNode new.
	text text: aString.
	text setItalic
	currentNode children add: text.
	^ self
]

{ #category : #'as yet unclassified' }
GtLexicalDocumentBuilder >> link: aString url: aUrl [ 
	| link text |
	link := GtLexicalLinkNode new.
	link url: aUrl.
	
	text := GtLexicalTextNode new.
	text text: aString.
	link children add: text.
	
	currentNode children add: link.
	^ self
]

{ #category : #'as yet unclassified' }
GtLexicalDocumentBuilder >> paragraph: aBlock [ 
	| paragraph |
	paragraph := GtLexicalParagraphNode new.
	currentNode children add: paragraph.
	currentNode := paragraph.
	aBlock value.
	currentNode := editorState root.
	^ self
]

{ #category : #'as yet unclassified' }
GtLexicalDocumentBuilder >> strikethroughText: aString [ 
	| text |
	text := GtLexicalTextNode new.
	text text: aString.
	text setStrikethrough.
	currentNode children add: text.
	^ self
]

{ #category : #'as yet unclassified' }
GtLexicalDocumentBuilder >> text: aString [ 
	| text |
	text := GtLexicalTextNode new.
	text text: aString.
	currentNode children add: text.
	^ self
]
