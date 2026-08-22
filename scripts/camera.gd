class_name PlayerCamera
extends Camera2D


func _ready() -> void:
	EventBus.LEVEL_LOAD_COMPLETE.connect(_on_load_complete)
	LevelManager.camera_ready = true


func _on_load_complete() -> void:
	GameManager.game.player.camera = self
	GameManager.game.player.moved.connect(_on_player_move)
	
	_lock_limits_to_map_size()
	
	move_to(GameManager.game.player.tile.grid_loc * Util.TILE_SIZE, true)


func _lock_limits_to_map_size() -> void:
	@warning_ignore("integer_division")
	var half_limit: Vector2i = Vector2i(Util.TILE_SIZE.x / 2, Util.TILE_SIZE.y / 2)
	
	limit_left = -half_limit.x
	limit_top = -half_limit.y
	limit_right = GameManager.game.field.level.size.x * Util.TILE_SIZE.x - half_limit.x
	limit_bottom = GameManager.game.field.level.size.y * Util.TILE_SIZE.y - half_limit.y


func _on_player_move() -> void:
	move_to(GameManager.game.player.tile.grid_loc * Util.TILE_SIZE)


func move_to(loc: Vector2i, instant: bool = false) -> void:
	position_smoothing_enabled = not instant
	position = loc
