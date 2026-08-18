@abstract
class_name DungeonGeneration
extends Resource

var tiles: Array[Array] = []
var map_size: Vector2i


func _init(size: Vector2i = Vector2i(10, 10)) -> void:
	map_size = size


@abstract
func generate() -> Array[Array]


func _initialise_tiles_array() -> void:
	for x: int in map_size.x:
		var row: Array = []
		for y: int in map_size.y:
			var new_tile: Tile = Tile.new()
			new_tile.grid_loc = Vector2(x, y)
			row.append(new_tile)
		tiles.append(row)
