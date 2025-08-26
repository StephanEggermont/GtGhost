Class {
	#name : #GtGhostInstance,
	#superclass : #Object,
	#instVars : [
		'credentials',
		'token',
		'exp',
		'baseUrl',
		'client'
	],
	#category : #'GtGhost-Model'
}

{ #category : #accessing }
GtGhostInstance >> client [
	^ client
]

{ #category : #accessing }
GtGhostInstance >> client: anObject [
	client := anObject
]

{ #category : #accessing }
GtGhostInstance >> createToken [
	| now |
	now := ZTimestamp nowTruncated.
	exp := now + 5 minutes.
	token := JsonWebSignature new
		algorithmName: 'HS256';
		payload: (JWTClaimsSet new
			audiences: '/admin/';
			iat: now asUnixTime;
			exp: exp asUnixTime);
		key: (ByteArray readHexFrom:($: split: credentials) second).
	token header at: 'kid' put: self kid.
	^token
		
]

{ #category : #accessing }
GtGhostInstance >> kid [
	^($: split:(Character space split: credentials) second) first
]

{ #category : #accessing }
GtGhostInstance >> readCredentialsFrom: aFileName [
	credentials := aFileName asFileReference contents
]

{ #category : #accessing }
GtGhostInstance >> refreshToken [
	token := self createToken.
	client request setAuthorization: 'Ghost ' , token compactSerialized.

]

{ #category : #accessing }
GtGhostInstance >> setUpConnection [
	"assumes credentials are set up"
	token := self createToken.
	client := ZnClient new.
	baseUrl:= 'https://www.' , self site , '/ghost/api/'.
	client request setAuthorization: 'Ghost ' , token compactSerialized.

]

{ #category : #accessing }
GtGhostInstance >> site [
	^(Character space split: credentials) first
]

{ #category : #accessing }
GtGhostInstance >> testConnection [
	credentials isEmptyOrNil
		ifTrue: [ ^ Exception signal: 'Credentials are not set' ].
	self setUpConnection. 
	client url: baseUrl,'/admin/posts'.
	^client get.

]

{ #category : #'as yet unclassified' }
GtGhostInstance >> tokenStillValid [
	^ZTimestamp nowTruncated < exp
]
