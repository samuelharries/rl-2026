class_name FloorTerrain
extends Terrain


func _init() -> void:
	solid = false
	displayed_name = "an empty floor"
	displayed_character = "·"
	displayed_color = Color.WHITE
	background_color = Color(0.1, 0.1, 0.1, 1.0)
