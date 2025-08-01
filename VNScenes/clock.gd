extends Dialogic_Button

static var open_time = 240

func on_press():
	if GameClock.time < open_time:
		Dialogic.start("EarlyClock")
	else:
		Dialogic.start("OpenClock")

func process():
	GameClock.timer.paused = Dialogic.current_timeline!=null
		
