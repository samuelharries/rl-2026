class_name Body
extends Resource

var actor: Actor
var health: int


func _init(_actor: Actor) -> void:
	actor = _actor


func take_damage(dmg: Damage) -> void:
	health = health - dmg.amount
	print("I now have ", health, " health.")
	if health <= 0:
		actor.die()


func heal(dmg: Damage) -> void:
	health = health + dmg.amount


func get_attack_damage_type() -> Damage.Type:
	return Damage.Type.Physical


func get_defense(_type: Damage.Type) -> int:
	return 1
