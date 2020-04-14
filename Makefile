all:
	touch R.generated.swift
	bundle install
	carthage bootstrap --platform iOS

open:
	open wkwktodo.xcodeproj
