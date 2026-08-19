extends Node

var save_nodes: Array[Node]


func register(node: Node) -> void:
	if save_nodes.has(node):
		push_error("Tried to Register ", node, " more than once!")
		return
	save_nodes.append(node)


func unregister(node: Node) -> void:
	save_nodes.erase(node)


func save_game() -> void:
	var save_file: FileAccess = FileAccess.open("user://savegame.json", FileAccess.WRITE)
	
	for node: Node in save_nodes:
		if not node.has_method("save_object"):
			print("Node ", node, " set to save, but missing save function. Skipping.")
			continue
		
		var node_data: Dictionary = node.save_object()
		var json_string: String = JSON.stringify(node_data)
		save_file.store_line(json_string)
	
	save_file.close()
