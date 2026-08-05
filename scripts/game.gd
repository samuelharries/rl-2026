class_name Game
extends Node2D

@onready var field: Field = $Field
var player: Player


func _ready() -> void:
	Util.game = self
	player = Player.new()
	player.tile = field.get_random_tile()


func _input(event: InputEvent) -> void:
	if player.movement(event):
		return
