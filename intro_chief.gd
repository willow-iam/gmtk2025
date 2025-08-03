extends Sprite2D

func _ready() -> void:
	Dialogic.timeline_ended.connect(queue_free)
