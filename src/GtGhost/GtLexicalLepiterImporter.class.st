Class {
	#name : #GtLexicalLepiterImporter,
	#superclass : #Object,
	#category : #'GtGhost-Lexical'
}

{ #category : #'as yet unclassified' }
GtLexicalLepiterImporter class >> convertCodeToSnippet: aCodeNode [ 
	"Convert code block to code snippet"
	| code |
	code := String streamContents: [ :stream |
		aCodeNode children do: [ :child |
			child class = GtLexicalTextNode ifTrue: [
				stream nextPutAll: (child text) ] ] ].
	
	^ LeCodeSnippet code: code
]

{ #category : #'as yet unclassified' }
GtLexicalLepiterImporter class >> convertHeadingToSnippet: aHeadingNode [ 
	"Convert heading to text snippet with formatting"
	| text |
	text := String streamContents: [ :stream |
		stream nextPutAll: '# '.
		aHeadingNode children do: [ :child |
			child class = GtLexicalTextNode ifTrue: [
				stream nextPutAll: (child text) ] ] ].
	
	^ LeTextSnippet string: text
]

{ #category : #'as yet unclassified' }
GtLexicalLepiterImporter class >> convertNodeToSnippet: aNode [ 
	"Convert a Lexical node to a Lepiter snippet"
	
	aNode class = GtLexicalParagraphNode ifTrue: [
		^ self convertParagraphToSnippet: aNode ].
	
	aNode class = GtLexicalCodeNode ifTrue: [
		^ self convertCodeToSnippet: aNode ].
	
	aNode class = GtLexicalHeadingNode ifTrue: [
		^ self convertHeadingToSnippet: aNode ].
	
	^ nil
]

{ #category : #'as yet unclassified' }
GtLexicalLepiterImporter class >> convertParagraphToSnippet: aParagraphNode [ 
	"Convert paragraph to text snippet"
	| text |
	text := String streamContents: [ :stream |
		aParagraphNode children do: [ :child |
			child class = GtLexicalTextNode ifTrue: [
				stream nextPutAll: (child instVarNamed: 'text') ] ] ].
	
	^ LeTextSnippet string: text
]

{ #category : #'as yet unclassified' }
GtLexicalLepiterImporter class >> importFromFile: aFileReference [ 
	"Import Lexical document from file"
	^ self importFromString: aFileReference contents
]

{ #category : #'as yet unclassified' }
GtLexicalLepiterImporter class >> importFromString: aString [ 
	"Import Lexical document from JSON string"
	^ GtLexicalEditorState fromJsonString: aString
]

{ #category : #'as yet unclassified' }
GtLexicalLepiterImporter class >> importToLepiterPage: aString [ 
	"Import Lexical document and convert to Lepiter snippets"
	| editorState snippets |
	editorState := self importFromString: aString.
	snippets := OrderedCollection new.
	
	editorState root children do: [ :node |
		(self convertNodeToSnippet: node) ifNotNil: [ :snippet |
			snippets add: snippet ] ].
	
	^ snippets
]
