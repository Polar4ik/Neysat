extends Node

var debug_called: Array[Node]

func _ready() -> void:
	debug_called.append_array(get_tree().get_nodes_in_group("debug"))
