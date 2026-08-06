class_name EscapeAction
extends Action


static func create_for(src: Actor, targ: Actor = null, _opts: Dictionary = {}) -> EscapeAction:
	var a: EscapeAction = EscapeAction.new()
	a.source = src
	a.target = targ
	return a


func score() -> float:
	return 1.0


func can_execute() -> bool:
	return true


func execute() -> void:
	Util.get_tree().quit()


func undo() -> void:
	pass
