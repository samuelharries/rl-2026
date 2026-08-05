class_name Field
extends Node2D

@export var tile_scene: PackedScene

var tiles: Array[Array]


func _ready() -> void:
	assert(tile_scene, "Field: Tile PackedScene isn't set.")
	_construct_tile_field()


func _construct_tile_field() -> void:
	for x: int in Util.MAP_SIZE.x:
		var row: Array = []
		for y: int in Util.MAP_SIZE.y:
			var new_tile: Tile = tile_scene.instantiate()
			new_tile.position = Vector2i(x * Util.TILE_SIZE.x, y * Util.TILE_SIZE.y)
			add_child(new_tile)
			row.append(new_tile)
		tiles.append(row)


func get_random_tile() -> Tile:
	var x: int = randi_range(0, Util.MAP_SIZE.x - 1)
	var y: int = randi_range(0, Util.MAP_SIZE.y - 1)
	return tiles[x][y]
