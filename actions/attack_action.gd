class_name AttackAction
extends Action

var combat: Combat


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
	combat = Combat.new(source, target)
	combat.resolve()


func undo() -> void:
	combat.undo()
