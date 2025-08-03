extends AnimatableBody2D
class_name Interactable
@export var timeline : DialogicTimeline
@export var directions : Array[Vector2]
@export var distances : Array[int]
@export var timeExit : int
var path_i :=0
var dist_left :=0

func _ready() -> void:
	assert(len(distances)==len(directions))
	if len(distances)>0:
		dist_left=distances[0]
	sync_to_physics=false
	#gravity_scale=0
	#lock_rotation=true

func _physics_process(delta: float) -> void:
	if GameClock.time>300:
		queue_free()
	elif GameClock.time>timeExit:
		if path_i<len(directions):
			if dist_left>0:
				translate(directions[path_i]*delta)
				dist_left-= directions[path_i].length()*delta
			else:
				path_i+=1
				if path_i<len(directions):
					dist_left=distances[path_i]
		
	
