extends Node
class_name HealthComponent


@export var MAX_HEALTH: float = 100.0
var health = 0.0:
	set(value):
		health = value
		health = clamp(health, 0.0, MAX_HEALTH)

#signal health_change(health: float)

func _ready() -> void:
	health = MAX_HEALTH


func take_damage(damage: float) -> void:
	health -= damage
	
	if health == 0.0:
		die()


func die() -> void:
	print("DIE") #Помянем 🫡

