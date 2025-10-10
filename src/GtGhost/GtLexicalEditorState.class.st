Class {
	#name : #GtLexicalEditorState,
	#superclass : #Object,
	#instVars : [
		'root'
	],
	#category : #'GtGhost-Lexical'
}

{ #category : #'as yet unclassified' }
GtLexicalEditorState class >> fromFile: aFileReference [ 
	"Load from a file"
	^ self fromJsonString: aFileReference contents
]

{ #category : #'as yet unclassified' }
GtLexicalEditorState class >> fromJsonString: aString [ 
	"Parse JSON string using STON and create an EditorState"
	| dict state |
	dict := STONJSON fromString: aString.
	state := self new.
	state root: (GtLexicalNode fromJsonDict: (dict at: 'root')).
	^ state
]

{ #category : #'as yet unclassified' }
GtLexicalEditorState >> asJsonString [ 
	"Convert to JSON string using STON"
	^ STONJSON toStringPretty: { #root -> root } asDictionary
]

{ #category : #'as yet unclassified' }
GtLexicalEditorState >> initialize [ 
	super initialize.
	root := GtLexicalRootNode new
]

{ #category : #accessing }
GtLexicalEditorState >> root [
	^ root
]

{ #category : #accessing }
GtLexicalEditorState >> root: anObject [
	root := anObject
]

{ #category : #'as yet unclassified' }
GtLexicalEditorState >> saveToFile: aFileReference [ 
	"Save to a file"
	aFileReference writeStreamDo: [ :stream |
		stream nextPutAll: self asJsonString ]
]

{ #category : #'as yet unclassified' }
GtLexicalEditorState >> stonOn: stonWriter [ 
	stonWriter writeObject: self listSingleton: { #root -> root }

]
