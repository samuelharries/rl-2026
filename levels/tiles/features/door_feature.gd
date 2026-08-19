class_name DoorwayTerrain
extends Feature

const OPEN_AT_GENERATION_PERCENTAGE: int = 50

var is_open: bool = true


func _init() -> void:
	displayed_color = Color.CORAL
	if OPEN_AT_GENERATION_PERCENTAGE > randi_range(0, 100):
		open_door()
	else:
		close_door()


func use_door(open: bool) -> bool:
	if is_open == open:
		return false
	if open:
		open_door()
	else:
		close_door()
	return true


func open_door() -> void:
	is_open = true
	displayed_name = "an open door"
	displayed_character = "■"


func close_door() -> void:
	is_open = false
	displayed_name = "a closed door"
	displayed_character = "+"
