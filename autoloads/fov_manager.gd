extends Node

var _active_fov: FOV:
	get():
		return GameManager.game.player.brain.get_fov()
	set(value):
		# TODO for debugging other mobs in future
		push_error("FOV_Manager: Attempting to set the active FOV manually.")


func _ready() -> void:
	TurnManager.is_player_turn.connect(update_fov_display)


func update_fov_display() -> void:
	var last_seen: Array[Tile] = _active_fov.tiles_in_view.duplicate()
	_active_fov.run_fov()
	
	for tile: Tile in last_seen:
		tile.in_sight = false
		tile.update_tile()
	
	for tile: Tile in _active_fov.tiles_in_view:
		tile.in_sight = true
		tile.seen = true
		tile.update_tile()
