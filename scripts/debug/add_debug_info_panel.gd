extends Node

@export var proops: Array[String]
@export var top_level: bool = true

var proops_value: Array[String]

func _ready() -> void:
	proops_value.resize(proops.size())

func _process(_delta: float) -> void:
	var i := 0
	for proop: String in proops:
		if get_parent().has_method(proop):
			proops_value[i] = str(get_parent().call(proop))
		else:
			proops_value[i] = str(get_parent().get(proop))
	
		i += 1
	
