extends Sprite2D
class_name CharacterMotion
var anim_player : AnimationPlayer
@export var prefix_name : String
var prev_pos

func _ready():
	anim_player = get_node("AnimationPlayer")
	prev_pos = global_position

func _process(_delta):
	var velocity = global_position - prev_pos
	if velocity == Vector2.ZERO:
		anim_player.play(prefix_name+"IdleDown")
	else:
		var math_dir = roundi(2*atan2(velocity.y,velocity.x)/PI)%4
		match math_dir:
			0:anim_player.play(prefix_name+"Right")
			1:anim_player.play(prefix_name+"Down")
			2:anim_player.play(prefix_name+"Left")
			-2:anim_player.play(prefix_name+"Left")
			-1:anim_player.play(prefix_name+"Up")
	prev_pos = global_position
