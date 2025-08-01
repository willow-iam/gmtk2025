extends Button

static var openTime = 15

func _ready():
	connect("pressed",on_press)

func on_press():
	if GameClock.time<ChiefInOffice.exitTime:
		Dialogic.start("ChiefSaysNo")
	elif GameClock.time>ChiefInOffice.exitTime+openTime:
		Dialogic.start("ClosedDesk")
	else:
		Dialogic.start("OpenDesk")
		#TODO: desk timer
