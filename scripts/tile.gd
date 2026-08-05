class_name Tile
extends Area2D

@onready var background_sprite: Sprite2D = $BackgroundSprite
@onready var collider: CollisionShape2D = $Collider
@onready var tile_label: Label = $TileControl/TileLabel

var _occupier: Actor = null
var occupier: Actor:
	get():
		return _occupier
	set(value):
		if _occupier != value:
			_occupier = value
			_update_tile()
		if _occupier:
			_occupier.tile = self


func _ready() -> void:
	assert(background_sprite, "Tile: Unable to find Background Sprite.")
	assert(collider, "Tile: Unable to find Collider.")
	assert(tile_label, "Tile: Unable to find Label")


func get_grid_loc() -> Vector2i:
	@warning_ignore("narrowing_conversion")
	return Vector2i(position.x / Util.TILE_SIZE.x, position.y / Util.TILE_SIZE.y)


func _update_tile() -> void:
	if occupier:
		tile_label.text = occupier.displayed_character
	else:
		tile_label.text = ""
