class_name Level
extends Resource

var tiles: Array[Array]
var size: Vector2i = Vector2.ZERO

func _init(new_size: Vector2i = Vector2i(5, 5)) -> void:
	size = new_size
	generate()


func generate() -> void:
	var generation: DungeonGeneration = CellularAutomata.new(size)
	tiles = generation.generate()
