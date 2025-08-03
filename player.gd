extends CharacterBody2D

@export var speed = 120
var interact_range : Area2D

func _ready():
	interact_range = get_node("InteractRange") as Area2D
	GameClock.restart()
	Dialogic.start("Intro")

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed



func get_interactable() -> Interactable:
	for that in interact_range.get_overlapping_bodies():
		if that is Interactable:
			return that
	return null

func _physics_process(_delta):
	if not Dialogic.current_timeline:
		get_input()
		move_and_slide()
		var interactable = get_interactable()
		if interactable:
			if Input.is_action_pressed("interact"):
				Dialogic.start(interactable.timeline)
				#Dialogic.VAR.set_variable("spoken.%s"%(that.name as String), true)
				Dialogic.timeline_ended.connect(
					func():
						if interactable: Dialogic.VAR.set_variable("spoken.%s"%(interactable.name as String), true)
				)

func unlock():
	var that = get_interactable()
	if that: that.queue_free()
