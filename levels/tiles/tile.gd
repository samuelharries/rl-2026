class_name Tile
extends Area2D

@onready var background_sprite: Sprite2D = $BackgroundSprite
@onready var collider: CollisionShape2D = $Collider
@onready var tile_label: Label = $TileControl/TileLabel

var terrain: Terrain = FloorTerrain.new()
var feature: Feature

var grid_loc: Vector2i = Vector2i.ZERO

var _occupier: Actor = null
var occupier: Actor:
	get():
		return _occupier
	set(value):
		if _occupier != value:
			_occupier = value
			update_tile()
		if _occupier:
			_occupier.tile = self


func _ready() -> void:
	assert(background_sprite, "Tile: Unable to find Background Sprite.")
	assert(collider, "Tile: Unable to find Collider.")
	assert(tile_label, "Tile: Unable to find Label")


func load_tile(new_tile: Tile) -> bool:
	assert(new_tile, "Tile: Attempted to load a null tile.")
	terrain = new_tile.terrain
	if new_tile.feature:
		feature = new_tile.feature
	update_tile()
	return true


func update_tile() -> void:
	if occupier:
		tile_label.text = occupier.displayed_character
		return
	# TODO: If Item, display item
	if feature:
		tile_label.text = feature.displayed_character
		return
	tile_label.text = terrain.displayed_character


func convert_terrain(type: Terrain) -> bool:
	if type == null:
		return false
	terrain = type
	update_tile()
	return true
