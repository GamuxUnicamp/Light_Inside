extends Node

var vos

func is_mobile():
	if vos=="Android" or vos=="iOS":
		return true
	return false
