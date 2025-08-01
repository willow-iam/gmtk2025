extends BaseDialogic
var children = Dictionary()
func _ready():
	for child in get_children():
		children[child.name]=child
	print(len(get_children()))

func _process(_delta: float) -> void:
	children["ChiefStation"]
	if GameClock.time > GameClock.EveryoneLeaves:
		children["MafiaStation"].show()
		children["GrannyStation"].show()
	else:
		children["MafiaStation"].hide()
		children["GrannyStation"].hide()
	
	if GameClock.time > ChiefInOffice.exitTime:
		children["ChiefStation"].show()
	else:
		children["ChiefStation"].hide()
		
