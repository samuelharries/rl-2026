extends Node

const MAP_SIZE: Vector2i = Vector2i(32, 16)
const TILE_SIZE: Vector2i = Vector2i(64, 64)

var game: Game


func get_tile(grid: Vector2i) -> Tile:
	return game.field.tiles[grid.x][grid.y]


func is_tile_invalid(grid: Vector2i) -> bool:
	if grid.x < 0 or grid.y < 0 or grid.x > MAP_SIZE.x or grid.y > MAP_SIZE.y:
		return true
	return false
