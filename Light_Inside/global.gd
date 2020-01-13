extends Node

var OS

func is_mobile():
	if OS=="Android" or OS=="iOS":
		return true
	return false