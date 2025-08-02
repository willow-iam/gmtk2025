extends CharacterBody2D

@export var speed = 120
var interact_range : ShapeCast2D


func _ready():
	interact_range = get_node("InteractRange") as ShapeCast2D
	interact_range.add_exception(self)
	GameClock.restart()
	Dialogic.start("Intro")

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(_delta):
	if not Dialogic.current_timeline:
		get_input()
		move_and_slide()
		if interact_range.is_colliding():
			for i in interact_range.get_collision_count():
				#TODO: "!" over player's head
				var that = interact_range.get_collider(i)
				if that is Interactable and Input.is_action_pressed("interact"):
					Dialogic.start(that.timeline)
					#Dialogic.VAR.set_variable("spoken.%s"%(that.name as String), true)
					Dialogic.timeline_ended.connect(
						func():
							Dialogic.VAR.set_variable("spoken.%s"%(that.name as String), true)
					)
					return
