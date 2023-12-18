extends Node

var debug_called: Array[Node]

func _ready() -> void:
	debug_called.append_array(get_tree().get_nodes_in_group("debug"))
	
	debug_called.reverse()
	debug_called.sort_custom(func(a, b): return a.main_node == b.main_node)

