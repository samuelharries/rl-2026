class_name Level
extends Resource

const FLAT_AMOUNT_OF_MONSTERS_AT_LEVEL_LOAD: int = 10

var tiles: Array[Array]
var size: Vector2i = Vector2.ZERO
var last_player_loc: Vector2i
var difficulty: int = 0
var mobs: Array[Mob]


func _init(new_size: Vector2i = Vector2i(5, 5)) -> void:
	size = new_size
	generate()


func generate() -> void:
	var generation: DungeonGeneration = CellularAutomata.new(size)
	tiles = generation.generate()
	populate()


func populate() -> void:
	for count: int in FLAT_AMOUNT_OF_MONSTERS_AT_LEVEL_LOAD + difficulty:
		mobs.append(MobManager.create_monster())
	
	for mob: Mob in mobs:
		while true:
			var loc: Tile = get_random_accessible_tile()
			if loc == null:
				continue
			if loc.occupier:
				continue
			MobManager.place_actor(mob, loc)
			break


func get_random_tile() -> Tile:
	var x: int = randi_range(0, size.x - 1)
	var y: int = randi_range(0, size.y - 1)
	return tiles[x][y]


func get_random_accessible_tile() -> Tile:
	while true:
		var tile: Tile = get_random_tile()
		if not tile.terrain.solid:
			return tile 
	return
