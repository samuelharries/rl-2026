class_name MainMenu
extends Node2D

@onready var new_game_button: Button = $CanvasLayer/Control/MainButtonContainer/NewGameButton
@onready var load_game_button: Button = $CanvasLayer/Control/MainButtonContainer/LoadGameButton
@onready var options_button: Button = $CanvasLayer/Control/MainButtonContainer/OptionsButton
@onready var quit_button: Button = $CanvasLayer/Control/MainButtonContainer/QuitButton


func _ready() -> void:
	assert(new_game_button, "MainMenu: New Game Button cannot be found.")
	assert(load_game_button, "MainMenu: Load Game Button cannot be found.")
	assert(options_button, "MainMenu: Options Button cannot be found.")
	assert(quit_button, "MainMenu: Quit Button cannot be found.")
	
	new_game_button.pressed.connect(_on_new_game_button_pressed)
	load_game_button.pressed.connect(_on_load_game_button_pressed)
	options_button.pressed.connect(_on_options_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)


func _on_new_game_button_pressed() -> void:
	SceneLoader.load_scene("uid://vbstk7y3rgeh")


func _on_load_game_button_pressed() -> void:
	pass


func _on_options_button_pressed() -> void:
	pass


func _on_quit_button_pressed() -> void:
	get_tree().quit()
