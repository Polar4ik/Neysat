extends Node
class_name HealthComponent

signal sig_die
#signal health_change(health: float)

@export var MAX_HEALTH := 100.0
var health := 0.0:
	set(value):
		health = value
		health = clamp(health, 0.0, MAX_HEALTH)


func _ready() -> void:
	health = MAX_HEALTH


func reset_health() -> void:
	health = MAX_HEALTH


func take_damage(damage: float) -> void:
	health -= damage
	
	if health == 0.0:
		die()


func die() -> void:
	sig_die.emit()
