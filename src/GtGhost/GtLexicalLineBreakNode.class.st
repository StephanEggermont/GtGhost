Class {
	#name : #GtLexicalLineBreakNode,
	#superclass : #GtLexicalNode,
	#category : #'GtGhost-Lexical'
}

{ #category : #'as yet unclassified' }
GtLexicalLineBreakNode >> initialize [ 
	super initialize.
	type := 'linebreak'
]
