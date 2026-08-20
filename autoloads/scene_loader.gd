extends Node

signal progress_changed(progress: float)
signal load_finished

var loading_screen: PackedScene = preload("uid://ebtdmdbskdyp")
var loaded_resource: PackedScene
var scene_path: String
var progress: Array = []
const use_sub_threads: bool = true


func _ready() -> void:
	assert(loading_screen, "SceneLoader: Loading Screen scene preload failed.")
	set_process(false)


func load_scene(_scene_path: String) -> void:
	scene_path = _scene_path
	
	var new_load_screen: CanvasLayer = loading_screen.instantiate()
	add_child(new_load_screen)
	progress_changed.connect(new_load_screen._on_progress_changed)
	load_finished.connect(new_load_screen._on_load_finished)
	
	await new_load_screen.loading_screen_ready
	
	start_load()


func start_load() -> void:
	var state: Error = ResourceLoader.load_threaded_request(scene_path, "", use_sub_threads)
	
	if state != OK:
		push_error("SceneLoader: Failed to start threaded load for: %s" % scene_path)
		return
	
	set_process(true)


func _process(_delta: float) -> void:
	var load_status: ResourceLoader.ThreadLoadStatus = ResourceLoader.load_threaded_get_status(scene_path, progress)
	
	if progress.size() > 0:
		progress_changed.emit(progress[0])
	
	match load_status:
		ResourceLoader.THREAD_LOAD_INVALID_RESOURCE, ResourceLoader.THREAD_LOAD_FAILED:
			set_process(false)
		ResourceLoader.THREAD_LOAD_LOADED:
			set_process(false)
			loaded_resource = ResourceLoader.load_threaded_get(scene_path)
			load_finished.emit()
			await get_tree().process_frame
			get_tree().change_scene_to_packed(loaded_resource)
