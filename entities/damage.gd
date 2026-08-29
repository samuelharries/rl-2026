class_name Damage
extends RefCounted

enum Type {Physical, Fire, Poison}

var type: Type
var amount: int


func _init(_amount: int, _type: Type) -> void:
	amount = _amount
	type = _type
