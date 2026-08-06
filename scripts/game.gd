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


func place_actor(actor: Actor, tile: Tile) -> bool:
	if not tile or not actor:
		return false
	tile.occupier = actor
	return true
