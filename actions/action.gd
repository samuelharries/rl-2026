@abstract
class_name Action
extends RefCounted

var source: Actor
var target: Actor


static func create_for(_src: Actor, _targ: Actor = null, _opts: Dictionary = {}) -> Action:
	return


@abstract
func score() -> float


@abstract
func can_execute() -> bool


@abstract
func execute() -> void


@abstract
func undo() -> void
