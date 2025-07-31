extends Node2D
class_name BaseDialogic


func _ready() -> void:
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.Choices.choice_selected.connect(_choice_received)
	Dialogic.start(name as String)
	
func _on_timeline_ended():
	pass

func _choice_received(info):
	pass
