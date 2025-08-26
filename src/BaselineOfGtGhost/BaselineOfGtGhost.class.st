Class {
	#name : #BaselineOfGtGhost,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtGhost
}

{ #category : #loading }
BaselineOfGtGhost class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'GtGhost' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGtGhost >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtGhost'
		]
]
