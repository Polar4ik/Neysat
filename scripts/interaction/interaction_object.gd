extends StaticBody3D
class_name InteractionObject

signal interact

@export var prompt := ""


func get_promt() -> String:
	return prompt


func interaction() -> void:
	interact.emit()


