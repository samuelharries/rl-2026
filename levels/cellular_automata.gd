class_name CellularAutomata
extends DungeonGeneration

const CELLULAR_PASS_QUANTITY: int = 5
const CELLULAR_PASS_START_PERCENTAGE: int = 45
enum floor_type {wall, open}


func generate() -> Array[Array]:
	_initialise_tiles_array()
	
	var temp_array: Array[Array] = []
	for x: int in map_size.x:
		var row: Array[floor_type] = []
		for y: int in map_size.y:
			var type: floor_type = _pick_random_tile_type()
			row.append(type)
		temp_array.append(row)
	
	for passes: int in CELLULAR_PASS_QUANTITY:
		temp_array = _cellular_pass(temp_array)
	
	for x: int in map_size.x:
		for y: int in map_size.y:
			if temp_array[x][y] == floor_type.wall:
				tiles[x][y].convert_terrain(WallTerrain.new())
			else:
				tiles[x][y].convert_terrain(FloorTerrain.new())
	
	return tiles


func _pick_random_tile_type() -> floor_type:
	if(randi_range(1, 100) < CELLULAR_PASS_START_PERCENTAGE):
		return floor_type.open
	else:
		return floor_type.wall


func _cellular_pass(array: Array[Array]) -> Array[Array]:
	var next_generation: Array[Array] = []
	for x: int in map_size.x:
		var row: Array[floor_type] = []
		for y: int in map_size.y:
			if x == 0 or y == 0 or x == map_size.x - 1 or y == map_size.y - 1:
				row.append(floor_type.wall)
			elif _count_wall_neighbours(array, Vector2i(x, y)) > 4:
				row.append(floor_type.wall)
			else:
				row.append(floor_type.open)
		next_generation.append(row)
	return next_generation


func _count_wall_neighbours(array: Array[Array], loc: Vector2i) -> int:
	assert(array.size() > 0, "Cellular Automata: Array empty.")
	
	var count: int = 0
	var neighbors: Array[Vector2i] = Util.get_neighbor_directions(loc)
	for neighbor: Vector2i in neighbors:
		if neighbor.x < 0 or neighbor.y < 0 or neighbor.x > map_size.x or neighbor.y > map_size.y:
			count = count + 1
			continue
		if array[neighbor.x][neighbor.y] == floor_type.wall:
			count = count + 1
	return count
