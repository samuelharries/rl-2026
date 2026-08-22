class_name FOV
extends Resource

var actor: Actor
var view_distance: int:
	get():
		return actor.brain.view_distance
	set(value):
		push_error("Attempting to set view distance in FOV rather than thru the Brain.")

var tiles_in_view: Array[Tile]


func _init(_actor: Actor) -> void:
	actor = _actor


func run_fov() -> void:
	tiles_in_view.clear()
	var loc: Vector2i = actor.get_loc()
	
	tiles_in_view.append(actor.tile)
	
	for oct: int in range(8):
		_add_octant_to_viewed_tiles(loc, oct)


func _add_octant_to_viewed_tiles(player_loc: Vector2i, octant: int) -> void:
	for row: int in view_distance:
		for col: int in row + 1:
			var transform: Vector2i = transform_octant(row, col, octant)
			transform = transform + player_loc
			if Util.is_tile_invalid(transform):
				continue
			tiles_in_view.append(Util.get_tile(transform))


func transform_octant(r: int, c: int, oct: int) -> Vector2i:
	match oct:
		0: return Vector2i( c, -r)
		1: return Vector2i( r, -c)
		2: return Vector2i( r,  c)
		3: return Vector2i( c,  r)
		4: return Vector2i(-c,  r)
		5: return Vector2i(-r,  c)
		6: return Vector2i(-r, -c)
		7: return Vector2i(-c, -r)
		_:
			push_error("FOV: Improper octant set while transforming.")
			return Vector2i.ZERO
