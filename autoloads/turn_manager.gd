extends Node

signal turn_taken(is_player: bool)
signal is_player_turn

var actors: Array[Actor]
var player: Player:
	get():
		return GameManager.game.player
	set(value):
		push_error("Attempting to set Player in Turn Manager. Set it through GameManager/Game instead.")


func _ready() -> void:
	turn_taken.connect(_on_turn_taken)
	EventBus.LEVEL_LOAD_COMPLETE.connect(_on_level_load_complete)


func _on_level_load_complete() -> void:
	is_player_turn.emit()


func _on_turn_taken(is_player: bool) -> void:
	if is_player:
		take_turns()


func take_turns() -> void:
	if actors.size() > 0:
		for actor: Actor in actors:
			actor.brain.take_turn()
	
	is_player_turn.emit()


func register_actor(actor: Actor) -> bool:
	if actors.has(actor):
		return false
	actors.append(actor)
	return true


func unregister_actor(actor: Actor) -> bool:
	if actors.has(actor):
		actors.erase(actor)
		return true
	return false
