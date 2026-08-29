class_name Combat
extends RefCounted

var attacker: Actor
var defender: Actor
var damage: Damage


func _init(_attacker: Actor, _defender: Actor) -> void:
	attacker = _attacker
	defender = _defender


func resolve() -> void:
	damage = Damage.new(3, Damage.Type.Physical)
	print("Attacking ", defender.get_displayed_name(), " for ", damage.amount, " dmg.")
	defender.take_damage(damage)


func undo() -> void:
	defender.heal(damage)
