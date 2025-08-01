extends Dialogic_Button

func _process(delta: float) -> void:
	if Dialogic.VAR.get_variable("inventory.handcuffs"):
		show()
	else:
		hide()

func _on_timeline_ended():
	get_tree().change_scene_to_file("res://VNScenes/Intro.tscn")
