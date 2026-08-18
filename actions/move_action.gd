class_name MoveAction
extends Action

var dest_tile: Tile
var old_tile: Tile


static func create_for(src: Actor, targ: Actor = null, opts: Dictionary = {}) -> MoveAction:
	var a: MoveAction = MoveAction.new()
	a.source = src
	a.target = targ
	a.dest_tile = Util.get_tile(opts.get("tile_loc"))
	return a


func score() -> float:
	return 1.0


func can_execute() -> bool:
	if dest_tile.terrain.solid:
		return false 
	return true


func execute() -> void:
	if source.tile:
		old_tile = source.tile
		source.tile.occupier = null
	dest_tile.occupier = source


func undo() -> void:
	source.tile.occupier = null
	if old_tile:
		old_tile.occupier = source
