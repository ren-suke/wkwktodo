all:
	touch R.generated.swift
	bundle install
	carthage update --platform iOS --no-use-binaries

open:
	open wkwktodo.xcodeproj
