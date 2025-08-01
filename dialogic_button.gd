extends Button
class_name Dialogic_Button
@export var leaves:bool

func _ready():
	connect("pressed",on_press)

func on_press():
	Dialogic.start(name as String)
	if len(Dialogic.timeline_ended.get_connections())>0:
		Dialogic.timeline_ended.disconnect(Dialogic.timeline_ended.get_connections()[0]['callable'])
	Dialogic.timeline_ended.connect(_on_timeline_ended)

func _on_timeline_ended():
	Dialogic.VAR.set_variable("spoken.%s"%(name as String), true)

func _process(_delta: float) -> void:
	if leaves and GameClock.time > GameClock.EveryoneLeaves:
		hide()
