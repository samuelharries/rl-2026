class_name PauseUI
extends CanvasLayer

@onready var resume_button: Button = $PauseControl/MenuPanel/MarginContainer/MenuContainer/ResumeButton
@onready var options_button: Button = $PauseControl/MenuPanel/MarginContainer/MenuContainer/OptionsButton
@onready var debug_button: Button = $PauseControl/MenuPanel/MarginContainer/MenuContainer/DebugButton
@onready var save_button: Button = $PauseControl/MenuPanel/MarginContainer/MenuContainer/SaveButton
@onready var quit_button: Button = $PauseControl/MenuPanel/MarginContainer/MenuContainer/QuitButton

@onready var options_panel: Panel = $PauseControl/OptionsPanel
@onready var back_button: Button = $PauseControl/OptionsPanel/MarginContainer/BackButton


func _ready() -> void:
	_hook_up_ui_connections()


func _hook_up_ui_connections() -> void:
	assert(resume_button, "PauseUI: Resume Button not found/set on Ready.")
	assert(options_button, "PauseUI: Options Button not found/set on Ready.")
	assert(debug_button, "PauseUI: Debug Button not found/set on Ready.")
	assert(save_button, "PauseUI: Save Button not found/set on Ready.")
	assert(quit_button, "PauseUI: Quit Button not found/set on Ready.")
	assert(options_panel, "PauseUI: Options Panel not found/set on Ready.")
	
	assert(back_button, "Pause:UI: Back Button not found/set on Ready.")
	
	resume_button.pressed.connect(_on_resume_button_pressed)
	options_button.pressed.connect(_on_options_button_pressed)
	save_button.pressed.connect(_on_save_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)
	
	back_button.pressed.connect(on_back_button_pressed)
	
	if GameManager.DEBUG_MODE:
		debug_button.visible = true
		debug_button.pressed.connect(_on_debug_button_pressed)


func is_deeper_window_open() -> bool:
	if options_panel.visible:
		return true
	return false


func _on_resume_button_pressed() -> void:
	close_ui()


func _on_options_button_pressed() -> void:
	options_panel.visible = true


func _on_debug_button_pressed() -> void:
	pass


func _on_save_button_pressed() -> void:
	pass


func _on_quit_button_pressed() -> void:
	Util.get_tree().quit()


func on_back_button_pressed() -> void:
	options_panel.visible = false


func open_ui() -> void:
	visible = true
	GameManager.menu_open = true


func close_ui() -> void:
	visible = false
	GameManager.menu_open = false
