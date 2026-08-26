extends Node

const TILE_SIZE: Vector2i = Vector2i(64, 64)


func get_tile(grid: Vector2i) -> Tile:
	return GameManager.game.field.tiles[grid.x][grid.y]


func is_tile_invalid(grid: Vector2i) -> bool:
	var map_size: Vector2i = GameManager.game.field.level.size
	if grid.x < 0 or grid.y < 0 or grid.x > map_size.x - 1 or grid.y > map_size.y - 1:
		return true
	return false


func get_neighbor_directions(tile: Vector2i) -> Array[Vector2i]:
	return [tile - Vector2i(-1, -1), tile - Vector2i(0, -1), tile - Vector2i(1, -1),
			tile - Vector2i(-1,  0),                         tile - Vector2i(1,  0),
			tile - Vector2i(-1,  1), tile - Vector2i(0,  1), tile - Vector2i(1,  1)]


func pick_random(dictionary: Dictionary) -> Variant:
	var random_key: Variant = dictionary.keys().pick_random()
	return dictionary[random_key]
