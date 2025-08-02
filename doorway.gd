extends Area2D
class_name Doorway
@export var destination : Vector2

func _ready() -> void:
	if destination == Vector2(0,0):
		if has_node("Exit"):
			destination=get_node("Exit").global_position + Vector2(0,-24)
		elif name == "Exit" and get_parent() is Doorway:
			destination = get_parent().global_position + Vector2(0,24)

func _process(delta: float) -> void:
	if has_overlapping_bodies():
		var that = get_overlapping_bodies()[0]
		that.position = destination
