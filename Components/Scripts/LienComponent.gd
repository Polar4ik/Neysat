extends Node

enum LienEnum{
	NONE,
	LEFT,
	RIGHT
}
var lien_state := LienEnum.NONE
var lien_deg := 0.0

@onready var body := get_parent().find_child("Body")
@onready var collider := get_parent().find_child("Collider")

#func _input(_event: InputEvent) -> void:
#	if Input.is_action_just_pressed("right_lien") and lien_state == LienEnum.NONE:
#		lien_state = LienEnum.RIGHT
#		lien_deg = -35
#	elif Input.is_action_just_pressed("left_lien") and lien_state == LienEnum.NONE:
#		lien_state = LienEnum.LEFT
#		lien_deg = 35
#	elif Input.is_action_just_pressed("left_lien") or Input.is_action_just_pressed("right_lien") and lien_state != LienEnum.NONE:
#		lien_state = LienEnum.NONE
#		lien_deg = 0

#func _ready() -> void:
#	Events.lien_left.connect(lien_left)
#	Events.lien_right.connect(lien_right)

#func lien_left() -> void:
#	if lien_state == LienEnum.NONE:
#		lien_state = LienEnum.LEFT
#		lien_deg = 35
#		lien()
#	elif lien_state != LienEnum.NONE:
#		lien_state = LienEnum.NONE
#		lien_deg = 0
#		lien()
#
#func lien_right() -> void:
#	if lien_state == LienEnum.NONE:
#		lien_state = LienEnum.RIGHT
#		lien_deg = -35
#		lien()
#	elif lien_state != LienEnum.NONE:
#		lien_state = LienEnum.NONE
#		lien_deg = 0
#		lien()

func lien() -> void:
	body.rotation_degrees.z = lerp(float(body.rotation_degrees.z), lien_deg, 0.5)
	collider.rotation_degrees.z = lien_deg
