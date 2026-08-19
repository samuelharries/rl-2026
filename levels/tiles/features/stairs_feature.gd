class_name StairsFeature
extends Feature

var down_stairs: bool = false


func get_displayed_character() -> String:
	if down_stairs:
		return ">"
	return "<"
