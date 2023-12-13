extends VBoxContainer

var parameters_container_load := preload("res://components/debug/parameters_container.tscn")

func _ready() -> void:
	var i := 0
	for debuger in DebugManager.debug_called:
		var parametr_container := parameters_container_load.instantiate()
		
		add_child(parametr_container)
		
		var local_debug_text := ""
		var j := 0
		
		
		for proop: String in debuger.proops:
			local_debug_text += proop + "\n" + debuger.proops_value[j] + "\n"
			j += 1
			
		get_child(i).debuger_text = local_debug_text
		get_child(i).node_name = debuger.get_parent().name
		
		i += 1

func _process(_delta: float) -> void:
	var i := 0
	for debuger in DebugManager.debug_called:
		var local_debug_text := ""
		var j := 0
		for proop: String in debuger.proops:
			local_debug_text += proop + ":\n" + debuger.proops_value[j] + "\n"
			j += 1
			
		get_child(i).debuger_text = local_debug_text
		
		i += 1
