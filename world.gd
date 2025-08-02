extends Node2D
class_name World

func _ready():
	Dialogic.signal_event.connect(handle_dialogic_signal)

func handle_dialogic_signal(arg:String):
	if arg=="reset":
		Dialogic.VAR.reset()
		get_tree().reload_current_scene()
	elif arg =="unlock":
		get_node("Player").unlock()
