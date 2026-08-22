class_name Actor
extends Entity

var brain: Brain

var displayed_character: String = "£"
var tile: Tile = null
var fov: FOV:
	get():
		return brain.get_fov()
	set(value):
		push_error("Improperly attempting to set an FOV on an Actor.")


func _init() -> void:
	if not TurnManager.register_actor(self):
		print("Duplicated Actor")


func get_displayed_character() -> String:
	return displayed_character


func get_loc() -> Vector2i:
	return tile.grid_loc
