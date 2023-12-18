extends Node
class_name ClimpComponent

signal is_reload
signal no_ammo

@export_category("Climp")
@export var climp_count := 0
@export var climp_ammo_count: Array[int]

@export_category("Node")
@export var reload_timer: Timer

var select_climp_idx := 0


func get_ammo_count() -> int:
	return climp_ammo_count[select_climp_idx]


func shoot_ammo(value: int) -> void:
	climp_ammo_count[select_climp_idx] -= value
	climp_ammo_count[select_climp_idx] = clamp(climp_ammo_count[select_climp_idx], 0, INF)


func can_shoot() -> bool:
	return climp_ammo_count[select_climp_idx] > 0


func reload() -> void:
	reload_timer.start()


func _on_reload_time_timeout() -> void:
	if select_climp_idx < climp_count - 1:
		select_climp_idx += 1
	elif select_climp_idx == climp_count - 1:
		select_climp_idx = 0
