class_name Brain
extends Resource

var actor: Actor
var _fov: FOV
var view_distance: int = 5


func _init(_actor: Actor) -> void:
	actor = _actor


func take_turn() -> void:
	pass


func get_fov() -> FOV:
	if _fov == null:
		_fov = FOV.new(actor)
	return _fov
