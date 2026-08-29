class_name Actor
extends Entity

var brain: Brain
var body: Body

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


func take_damage(damage: Damage) -> void:
	body.take_damage(damage)


func die() -> void:
	print("Ugh, I'm dead.")
	tile.occupier = null
	TurnManager.unregister_actor(self)
