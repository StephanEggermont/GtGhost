Class {
	#name : #GtLexicalTextNode,
	#superclass : #GtLexicalNode,
	#instVars : [
		'text',
		'format',
		'mode',
		'style',
		'detail'
	],
	#category : #'GtGhost-Lexical'
}

{ #category : #accessing }
GtLexicalTextNode >> detail [
	^ detail
]

{ #category : #accessing }
GtLexicalTextNode >> detail: anObject [
	detail := anObject
]

{ #category : #accessing }
GtLexicalTextNode >> format [
	^ format
]

{ #category : #accessing }
GtLexicalTextNode >> format: anObject [
	format := anObject
]

{ #category : #'as yet unclassified' }
GtLexicalTextNode >> initialize [ 
	super initialize.
	type := 'text'.
	text := ''.
	format := 0.
	mode := 'normal'.
	style := ''.
	detail := 0
]

{ #category : #'as yet unclassified' }
GtLexicalTextNode >> initializeFromDict: aDictionary [ 
	super initializeFromDict: aDictionary.
	text := aDictionary at: 'text' ifAbsent: [ '' ].
	format := aDictionary at: 'format' ifAbsent: [ 0 ].
	mode := aDictionary at: 'mode' ifAbsent: [ 'normal' ].
	style := aDictionary at: 'style' ifAbsent: [ '' ].
	detail := aDictionary at: 'detail' ifAbsent: [ 0 ]
]

{ #category : #'as yet unclassified' }
GtLexicalTextNode >> isBold [ 
	^ (format bitAnd: 1) > 0
]

{ #category : #'as yet unclassified' }
GtLexicalTextNode >> isItalic [ 
	^ (format bitAnd: 2) > 0
]

{ #category : #'as yet unclassified' }
GtLexicalTextNode >> isStrikethrough [ 
	^ (format bitAnd: 4) > 0
]

{ #category : #'as yet unclassified' }
GtLexicalTextNode >> isUnderline [ 
	^ (format bitAnd: 8) > 0
]

{ #category : #accessing }
GtLexicalTextNode >> mode [
	^ mode
]

{ #category : #accessing }
GtLexicalTextNode >> mode: anObject [
	mode := anObject
]

{ #category : #'as yet unclassified' }
GtLexicalTextNode >> setBold [ 
	format := format bitOr: 1
]

{ #category : #'as yet unclassified' }
GtLexicalTextNode >> setItalic [ 
	format := format bitOr: 2
]

{ #category : #'as yet unclassified' }
GtLexicalTextNode >> setStrikethrough [
	format := format bitOr: 4
]

{ #category : #'as yet unclassified' }
GtLexicalTextNode >> setUnderline [
	format := format bitOr: 8
]

{ #category : #'as yet unclassified' }
GtLexicalTextNode >> stonFields [ 
	^ super stonFields
		add: #text -> text;
		add: #format -> format;
		add: #mode -> mode;
		add: #style -> style;
		add: #detail -> detail;
		yourself
]

{ #category : #accessing }
GtLexicalTextNode >> style [
	^ style
]

{ #category : #accessing }
GtLexicalTextNode >> style: anObject [
	style := anObject
]

{ #category : #accessing }
GtLexicalTextNode >> text [
	^ text
]

{ #category : #accessing }
GtLexicalTextNode >> text: anObject [
	text := anObject
]
