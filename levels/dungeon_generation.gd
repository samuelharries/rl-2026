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


func get_random_tile() -> Tile:
	var x: int = randi_range(0, map_size.x - 1)
	var y: int = randi_range(0, map_size.y - 1)
	return tiles[x][y]


func get_random_accessible_tile() -> Tile:
	while true:
		var tile: Tile = get_random_tile()
		if not tile.terrain.solid:
			return tile 
	return
