extends Button

func _ready():
	connect("pressed",on_press)

func on_press():
	get_tree().change_scene_to_file("res://VNScenes/WorldMap.tscn")
	print(Dialogic.VAR.inventory.paint)
