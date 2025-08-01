extends Node2D
class_name World

func _ready():
	Dialogic.signal_event.connect(reset)

func reset(arg:String):
	if arg=="reset":
		Dialogic.VAR.reset()
		get_tree().reload_current_scene()
