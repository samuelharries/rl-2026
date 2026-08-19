@abstract
class_name Terrain
extends Resource

var displayed_name: String = "UNSET"
var displayed_character: String = "£"
var displayed_color: Color = Color.WHITE
var background_color: Color = Color.BLACK
var solid: bool = false
var roughness: int = 0


func get_displayed_character() -> String:
	return displayed_character


func get_background_color() -> Color:
	return background_color
