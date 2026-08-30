class_name EscapeAction
extends Action


static func create_for(src: Actor, targ: Actor = null, _opts: Dictionary = {}) -> EscapeAction:
	var a: EscapeAction = EscapeAction.new()
	a.source = src
	a.target = targ
	return a


func score() -> float:
	return 1.0


func can_execute() -> bool:
	return true


func execute() -> void:
	var ui: PauseUI = GameManager.game.pause_ui
	if ui.visible:
		if ui.is_deeper_window_open():
			ui.on_back_button_pressed()
		else:
			ui.close_ui()
	else:
		ui.open_ui()


func undo() -> void:
	pass
