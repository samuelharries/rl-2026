extends Node

enum DungeonType {CellularAutomata, Rooms}

var levels: Array[Level]

# only let the modules declare ready, level manager handles unreadying.
var _player_ready: bool = false
var player_ready: bool:
	get:
		return _player_ready
	set(value):
		if not value:
			return
		_player_ready = value
		ready_checks()
var _level_ready: bool = false
var level_ready: bool:
	get:
		return _level_ready
	set(value):
		if not value:
			return
		_level_ready = value
		ready_checks()
var _camera_ready: bool = false
var camera_ready: bool:
	get:
		return _camera_ready
	set(value):
		if not value:
			return
		_camera_ready = value
		ready_checks()


func _ready() -> void:
	EventBus.LEVEL_CHANGING_BEGINNING.connect(_on_level_change_begin)


func _on_level_change_begin() -> void:
	_player_ready = false
	_level_ready = false
	_camera_ready = false


func ready_checks() -> void:
	if player_ready and level_ready and camera_ready:
		EventBus.LEVEL_LOAD_COMPLETE.emit()


func new_level() -> void:
	pass


func add_level(lvl: Level) -> void:
	levels.append(lvl)


func change_level() -> void:
	pass
