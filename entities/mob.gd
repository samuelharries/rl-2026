class_name Mob
extends Actor


func _init() -> void:
	brain = Brain.new(self)
	body = Body.new(self)
