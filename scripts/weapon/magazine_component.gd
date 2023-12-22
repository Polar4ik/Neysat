@tool
extends Node
class_name MagazineComponent

signal is_reload

@export var magazine_resource: MagazineResource
@export_range(0, 16) var magazine_count := 0:
	set(value):
		magazine_count = value
		notify_property_list_changed()

@export var magazine_bullet_array: Array[int]:
	set(value):
		magazine_bullet_array = value
		for i in magazine_bullet_array.size():
			magazine_bullet_array[i] = clamp(magazine_bullet_array[i], 0, magazine_resource.bullet_count)

@export var animator: AnimationPlayer


var select_magazine := 1


func _validate_property(property: Dictionary) -> void:
	if property.name == "magazine_count":
		magazine_bullet_array.resize(magazine_count)
		
		for magazine in magazine_bullet_array.size():
			magazine_bullet_array[magazine] = magazine_resource.bullet_count


func ammo_have() -> bool:
	return magazine_bullet_array[select_magazine - 1] > 0


func shoot() -> void:
	magazine_bullet_array[select_magazine - 1] -= 1


func reload() -> void:
	await animator.animation_finished
	
	if select_magazine < magazine_count:
		select_magazine += 1
	else:
		select_magazine = 1
	
	is_reload.emit()
