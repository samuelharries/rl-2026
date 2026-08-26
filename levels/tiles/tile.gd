class_name Tile
extends Area2D

@onready var background_sprite: Sprite2D = $BackgroundSprite
@onready var collider: CollisionShape2D = $Collider
@onready var tile_label: Label = $TileControl/TileLabel
@onready var fov_sprite: Sprite2D = $FOVSprite

var in_sight: bool = false
var seen: bool = false
var lit: bool = true

var terrain: Terrain
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
	assert(tile_label, "Tile: Unable to find Label.")
	assert(fov_sprite, "Tile: Unable to find FOV Sprite.")


func load_tile(new_tile: Tile) -> bool:
	assert(new_tile, "Tile: Attempted to load a null tile.")
	terrain = new_tile.terrain
	if new_tile.feature:
		feature = new_tile.feature
	if new_tile.occupier:
		occupier = new_tile.occupier
	update_tile()
	return true


func update_tile() -> void:
	_update_visibility()
	
	if background_sprite:
		background_sprite.modulate = terrain.get_background_color()


func _update_visibility() -> void:
	if seen and in_sight and lit:
		fov_sprite.modulate = Color(0.0, 0.0, 0.0, 0.0)
		_update_tile_label(true)
		return
	if seen and in_sight and not lit:
		fov_sprite.modulate = Color(0.0, 0.0, 0.0, 0.7)
		_update_tile_label(false)
		return
	if seen and not in_sight:
		fov_sprite.modulate = Color(0.0, 0.0, 0.0, 0.7)
		_update_tile_label(false)
		return
	if fov_sprite:
		fov_sprite.modulate = Color(0.0, 0.0, 0.0, 1)
	_update_tile_label(false)


func _update_tile_label(contents_viewable: bool) -> void:
	if contents_viewable:
		if occupier:
			tile_label.text = occupier.get_displayed_character()
			return
		# TODO: If Item, display item
		if feature:
			tile_label.text = feature.get_displayed_character()
			return
	if tile_label:
		tile_label.text = terrain.get_displayed_character()


func convert_terrain(type: Terrain) -> bool:
	if type == null:
		push_error("Attempting to convert to a null terrain")
	terrain = type
	return true
