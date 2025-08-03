extends Node2D
class_name World

func _ready():
	Dialogic.signal_event.connect(handle_dialogic_signal)
	get_node("AudioStreamPlayer").stream=load("res://audio/Loop.wav")
	get_node("AudioStreamPlayer").play()

func handle_dialogic_signal(arg:String):
	if arg=="reset":
		Dialogic.VAR.reset()
		get_tree().reload_current_scene()
	elif arg =="unlock":
		get_node("SortingDaddy/Jiminy").unlock()
	elif arg == "bg music":
		get_node("AudioStreamPlayer").stream = load("res://audio/emily game.mp3")
		get_node("AudioStreamPlayer").play()
