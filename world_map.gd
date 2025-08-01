extends BaseDialogic

const place_name_to_scene_name = {
	"The Police Department" : "Pigpen",
	"Granny's Quarters" : "GrannyQuarters",
	"My Quarters" : "MyQuarters",
	"The Shuttlebay" : "Shuttlebay",
	"The Mayor's Office" : "MayorOffice",
	"The Back Alley near the Mayor's office" : "BackAlley",
	"My Inventory" : "Inventory"
}

func _choice_received(info):
	get_tree().change_scene_to_file("res://VNScenes/{0}.tscn".format(
		[place_name_to_scene_name[info["text"]]]
		))
