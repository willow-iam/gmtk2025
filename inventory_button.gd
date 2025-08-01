extends Button
func _ready():
	pressed.connect(open_inventory)
	
func open_inventory():
	Dialogic.start("Winventory")
