Class {
	#name : #GtLexicalOrderedCollection,
	#superclass : #OrderedCollection,
	#category : #'GtGhost-Lexical'
}

{ #category : #'as yet unclassified' }
GtLexicalOrderedCollection >> addIfNotNil: anObject [
	anObject ifNotNil: [self add: anObject]
]
