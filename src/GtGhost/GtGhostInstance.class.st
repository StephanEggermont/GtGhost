Class {
	#name : #GtGhostInstance,
	#superclass : #Object,
	#instVars : [
		'credentials',
		'token',
		'exp'
	],
	#category : #'GtGhost-Model'
}

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
GtGhostInstance >> site [
	^(Character space split: credentials) first
]

{ #category : #accessing }
GtGhostInstance >> testConnection [
	| client |
	credentials isEmptyOrNil
		ifTrue: [ ^ Exception signal: 'Credentials are not set' ].
	token := self createToken.
	client := ZnClient new.
	client url: 'https://www.' , self site , '/ghost/api/admin/posts'.
	client request setAuthorization: 'Ghost ' , token compactSerialized.
	^client get.

]
