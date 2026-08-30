class_name Player
extends Actor

signal moved

var camera: PlayerCamera


func _init() -> void:
	displayed_character = "@"
	displayed_name = "Player"
	brain = PlayerBrain.new(self)
	body = Body.new(self)
	GameManager.game.player = self
	LevelManager.player_ready = true


func movement(event: InputEvent) -> bool:
	if GameManager.menu_open:
		return false
	
	var direction: Vector2i
	
	if event.is_action_pressed("move_up_left"):    direction = Vector2i(-1, -1)
	if event.is_action_pressed("move_up"):         direction = Vector2i( 0, -1)
	if event.is_action_pressed("move_up_right"):   direction = Vector2i( 1, -1)
	if event.is_action_pressed("move_left"):       direction = Vector2i(-1,  0)
	if event.is_action_pressed("move_right"):      direction = Vector2i( 1,  0)
	if event.is_action_pressed("move_down_left"):  direction = Vector2i(-1,  1)
	if event.is_action_pressed("move_down"):       direction = Vector2i( 0,  1)
	if event.is_action_pressed("move_down_right"): direction = Vector2i( 1,  1)
	
	if direction:
		var destination_loc: Vector2i = Vector2i(tile.grid_loc + direction)
		if Util.is_tile_invalid(destination_loc):
			return false
		
		var action: Action
		
		if Util.get_tile(destination_loc).occupier:
			action = AttackAction.create_for(self, Util.get_tile(destination_loc).occupier)
		else:
			action = MoveAction.create_for(self, null, {"tile_loc": destination_loc})
		
		if action.can_execute():
			action.execute()
			moved.emit()
		
		return true
	
	return false
