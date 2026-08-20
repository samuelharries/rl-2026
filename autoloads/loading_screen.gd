extends CanvasLayer

signal loading_screen_ready

@export var animation_player: AnimationPlayer


func _ready() -> void:
	assert(animation_player, "LoadingScreen: Animation Player isn't set.")
	
	await animation_player.animation_finished
	loading_screen_ready.emit()


func _on_progress_changed(_new_value: float) -> void:
	pass


func _on_load_finished() -> void:
	animation_player.play_backwards("transition")
	await animation_player.animation_finished
	SceneLoader.progress_changed.disconnect(_on_progress_changed)
	SceneLoader.load_finished.disconnect(_on_load_finished)
	queue_free()
