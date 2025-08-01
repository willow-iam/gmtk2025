extends Dialogic_Button
class_name ChiefInOffice
static var exitTime = 150

func _process(delta: float) -> void:
	if GameClock.time > exitTime:
		hide()
