extends BaseDialogic
class_name intro
func _ready() -> void:
	Dialogic.VAR.reset()
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start(name as String)
func _on_timeline_ended() -> void:
	get_tree().change_scene_to_file("res://VNScenes/MyQuarters.tscn")
