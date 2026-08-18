class_name PlayerCamera
extends Camera2D


func _ready() -> void:
	EventBus.LOAD_COMPLETE.connect(_on_load_complete)
	TurnManager.camera_ready = true


func _on_load_complete() -> void:
	Util.game.player.camera = self
	Util.game.player.moved.connect(_on_player_move)
	
	_lock_limits_to_map_size()
	
	move_to(Util.game.player.tile.grid_loc * Util.TILE_SIZE, true)


func _lock_limits_to_map_size() -> void:
	@warning_ignore("integer_division")
	limit_left = -(Util.TILE_SIZE.x / 2)
	@warning_ignore("integer_division")
	limit_top = -(Util.TILE_SIZE.y / 2)
	@warning_ignore("integer_division")
	limit_right = Util.game.field.level.size.x * Util.TILE_SIZE.x - (Util.TILE_SIZE.y / 2)
	@warning_ignore("integer_division")
	limit_bottom = Util.game.field.level.size.y * Util.TILE_SIZE.y - (Util.TILE_SIZE.y / 2)


func _on_player_move() -> void:
	move_to(Util.game.player.tile.grid_loc * Util.TILE_SIZE)


func move_to(loc: Vector2i, instant: bool = false) -> void:
	position_smoothing_enabled = not instant
	position = loc
