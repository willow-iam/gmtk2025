extends AnimatableBody2D
class_name Interactable
@export var timeline : DialogicTimeline

func Clock():
	if GameClock.time < GameClock.EveryoneLeaves:
		Dialogic.start("EarlyClock")
	else:
		Dialogic.start("OpenClock")

func PigDoor():
	if GameClock.time<ChiefInOffice.exitTime:
		Dialogic.start("ChiefSaysNo")
	elif GameClock.time>ChiefInOffice.exitTime+15:
		Dialogic.start("ClosedDesk")
	else:
		Dialogic.start("OpenDesk")
