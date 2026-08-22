class_name PlayerBrain
extends Brain

var _fovs: Array[FOV] = []


func get_fov() -> FOV:
	if _fovs.size() == 0 or _fovs.size() < GameManager.current_level_index:
		_fovs.append(FOV.new(actor))
	return _fovs[GameManager.current_level_index]
