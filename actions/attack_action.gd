class_name AttackAction
extends Action

static func create_for(src: Actor, targ: Actor = null, _opts: Dictionary = {}) -> AttackAction:
	var a: AttackAction = AttackAction.new()
	a.source = src
	a.target = targ
	return a


func score() -> float:
	return 1


func can_execute() -> bool:
	return true


func execute() -> void:
	print("You kick the ", target.displayed_name, "'s shins. It hurts, really.")


func undo() -> void:
	pass
