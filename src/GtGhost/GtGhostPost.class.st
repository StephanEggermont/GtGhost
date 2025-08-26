Class {
	#name : #GtGhostPost,
	#superclass : #Object,
	#instVars : [
		'html',
		'title'
	],
	#category : #'GtGhost-Model'
}

{ #category : #accessing }
GtGhostPost >> html [
	^ html
]

{ #category : #accessing }
GtGhostPost >> html: anObject [
	html := anObject
]

{ #category : #accessing }
GtGhostPost >> quotedHtml [
	^html copyReplaceAll: '"' with: '\"'.
]

{ #category : #accessing }
GtGhostPost >> title [
	^ title
]

{ #category : #accessing }
GtGhostPost >> title: anObject [
	title := anObject
]
