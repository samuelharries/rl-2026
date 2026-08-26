extends Node

var monster_dict: Dictionary[Mob, int] = {
	Goblin.new() : 50,
	Orc.new() : 50,
}


func create_monster() -> Mob:
	return get_random_mob()


func _get_tile_to_spawn_monster() -> Tile:
	return GameManager.game.field.get_random_accessible_tile()


func get_random_mob(dictionary: Dictionary = monster_dict) -> Mob:
	return dictionary.keys().pick_random()


func place_actor(actor: Actor, tile: Tile) -> bool:
	if not tile or not actor:
		push_error("Tile or Actor cannot be null during Place Actor.")
		return false
	tile.occupier = actor
	return true
