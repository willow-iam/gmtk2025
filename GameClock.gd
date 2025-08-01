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
	timer = get_child(0)
	timer.start(max_time*60)
func _process(delta: float) -> void:
	text = "11:%02d:%02d"%[(60-max_time+int(time/60)), (time%60)]
	
