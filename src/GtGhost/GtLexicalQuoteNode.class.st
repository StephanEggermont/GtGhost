Class {
	#name : #GtLexicalQuoteNode,
	#superclass : #GtLexicalElementNode,
	#category : #'GtGhost-Lexical'
}

{ #category : #'as yet unclassified' }
GtLexicalQuoteNode >> initialize [ 
	super initialize.
	type := 'quote'
]
