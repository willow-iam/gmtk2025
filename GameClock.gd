extends Label
var EveryoneLeaves=240
var timer:Timer
var max_time = 5#minutes
var time:
	get:
		if timer:
			return (max_time*60)-int(timer.time_left)
		else:
			return max_time*60

func _ready() -> void:
	restart()

func restart():
	timer = get_child(0)
	timer.start(max_time*60)

func _process(_delta: float) -> void:
	timer.paused = Dialogic.current_timeline!=null
	text = "11:%02d:%02d"%[(60-max_time+int(time/60)), (time%60)]
	
