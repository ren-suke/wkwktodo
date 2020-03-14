all:
	touch R.generated.swift
	carthage update --platform iOS --no-use-binaries

open:
	open wkwktodo.xcodeproj
