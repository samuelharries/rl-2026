class_name Game
extends Node2D

@onready var field: Field = $Field
var player: Player


func _ready() -> void:
	Util.game = self
	player = Player.new()
	place_actor(player, field.get_random_tile())


func _input(event: InputEvent) -> void:
	if player.movement(event):
		return
	if event.is_action_pressed("escape_button"):
		var action: EscapeAction = EscapeAction.create_for(null, null)
		if action.can_execute():
			action.execute()


func place_actor(actor: Actor, tile: Tile) -> bool:
	if not tile or not actor:
		push_error("Tile or Actor cannot be null during Place Actor.")
		return false
	tile.occupier = actor
	return true
