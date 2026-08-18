class_name Field
extends Node2D

@export var tile_scene: PackedScene

var level: Level
var tiles: Array[Array]


func _ready() -> void:
	assert(tile_scene, "Field: Tile PackedScene isn't set.")


func _deconstruct_tile_field() -> void:
	for x: int in level.size.x:
		for y: int in level.size.y:
			tiles[x][y].queue_free()
	tiles.clear()


func _construct_tile_field() -> void:
	if tiles.size() != 0:
		_deconstruct_tile_field()
	for x: int in level.size.x:
		var row: Array = []
		for y: int in level.size.y:
			var new_tile: Tile = tile_scene.instantiate()
			new_tile.position = Vector2i(x * Util.TILE_SIZE.x, y * Util.TILE_SIZE.y)
			new_tile.grid_loc = Vector2i(x, y)
			add_child(new_tile)
			row.append(new_tile)
		tiles.append(row)


func load_level(lvl: Level = Level.new(Vector2i(50, 50))) -> bool:
	assert(lvl, "Field: Attempted to load a null level.")
	level = lvl
	
	_construct_tile_field()
	assert(tiles.size() == lvl.tiles.size(), "Field: Attempted to load a mismatch tile array size.")
	
	for x: int in lvl.size.x:
		for y: int in lvl.size.y:
			tiles[x][y].load_tile(lvl.tiles[x][y])
	
	if not lvl.last_player_loc and not Util.game.player:
		Util.game.player = Player.new()
	
	Util.game.place_actor(Util.game.player, get_random_accessible_tile())
	
	TurnManager.level_ready = true
	return true


func get_random_tile() -> Tile:
	var x: int = randi_range(0, level.size.x - 1)
	var y: int = randi_range(0, level.size.y - 1)
	return tiles[x][y]


func get_random_accessible_tile() -> Tile:
	while true:
		var tile: Tile = get_random_tile()
		if not tile.terrain.solid:
			return tile 
	return
