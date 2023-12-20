extends Node
class_name MagazineComponent

signal is_reload
signal no_ammo

@export_category("Magazine")
@export var magazine_count := 0
@export var magazine_ammo_count: Array[int]

@export_category("Node")
@export var reload_timer: Timer

var select_magazine_idx := 0


func get_ammo_count() -> int:
	return magazine_ammo_count[select_magazine_idx]


func shoot_ammo(value: int) -> void:
	magazine_ammo_count[select_magazine_idx] -= value
	magazine_ammo_count[select_magazine_idx] = clamp(magazine_ammo_count[select_magazine_idx], 0, INF)


func can_shoot() -> bool:
	return magazine_ammo_count[select_magazine_idx] > 0


func reload() -> void:
	reload_timer.start()

func drop() -> void:
	pass

func _on_reload_time_timeout() -> void:
	if select_magazine_idx < magazine_count - 1:
		select_magazine_idx += 1
	elif select_magazine_idx == magazine_count - 1:
		select_magazine_idx = 0
