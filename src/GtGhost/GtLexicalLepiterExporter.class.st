Class {
	#name : #GtLexicalLepiterExporter,
	#superclass : #Object,
	#category : #'GtGhost-Lexical'
}

{ #category : #'as yet unclassified' }
GtLexicalLepiterExporter class >> convertCodeSnippet: aCodeSnippet [ 
	"Convert code snippet to Lexical code block"
	| codeNode textNode |
	codeNode := GtLexicalCodeNode new.
	codeNode instVarNamed: 'language' put: 'smalltalk'.
	
	textNode := GtLexicalTextNode new.
	textNode text: aCodeSnippet code.
	codeNode children add: textNode.
	
	^ codeNode
]

{ #category : #'as yet unclassified' }
GtLexicalLepiterExporter class >> convertDefaultSnippet: aSnippet [ 
	"Default conversion for unknown snippet types"
	| paragraph text |
	paragraph := GtLexicalParagraphNode new.
	
	text := GtLexicalTextNode new.
	text text: aSnippet asString.
	paragraph children add: text.
	
	^ paragraph
]

{ #category : #'as yet unclassified' }
GtLexicalLepiterExporter class >> convertSnippet: aSnippet [ 
	"Convert a Lepiter snippet to Lexical nodes"
	
	aSnippet class name = #LeTextSnippet ifTrue: [
		^ self convertTextSnippet: aSnippet ].
	
	aSnippet class name = #LeCodeSnippet ifTrue: [
		^ self convertCodeSnippet: aSnippet ].
	
	^ self convertDefaultSnippet: aSnippet
]

{ #category : #'as yet unclassified' }
GtLexicalLepiterExporter class >> convertTextSnippet: aTextSnippet [ 
	"Convert text snippet to Lexical paragraph"
	| paragraph text |
	paragraph := GtLexicalParagraphNode new.
	
	text := GtLexicalTextNode new.
	text text: aTextSnippet string.
	paragraph children add: text.
	
	^ paragraph
]

{ #category : #'as yet unclassified' }
GtLexicalLepiterExporter class >> exportPage: aLepiterPage [ 
	"Export a Lepiter page to Lexical format"
	| editorState |
	editorState := GtLexicalEditorState new.
	
	aLepiterPage children do: [ :snippet |
		(self convertSnippet: snippet) ifNotNil: [ :node |
			editorState root children add: node ] ].
	
	^ editorState asJsonString
]

{ #category : #'as yet unclassified' }
GtLexicalLepiterExporter class >> exportPageToFile: aLepiterPage file: aFileReference [ 
	"Export a Lepiter page to a file"
	| json |
	json := self exportPage: aLepiterPage.
	aFileReference writeStreamDo: [ :stream | stream nextPutAll: json ]
]
