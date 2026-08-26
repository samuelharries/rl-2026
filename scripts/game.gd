class_name Game
extends Node2D

@onready var field: Field = $Field
var player: Player


func _ready() -> void:
	GameManager.game = self
	SaveLoadManager.register(self)
	field.load_level()


func _input(event: InputEvent) -> void:
	if player.movement(event):
		return
	if event.is_action_pressed("escape_button"):
		var action: EscapeAction = EscapeAction.create_for(null, null)
		if action.can_execute():
			action.execute()
