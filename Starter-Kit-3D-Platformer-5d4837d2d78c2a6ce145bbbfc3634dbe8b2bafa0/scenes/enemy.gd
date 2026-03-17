extends CharacterBody3D

@export var speed = 5.0
@export var height_offset = 0.5
var player

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
	if player == null:
		return

	var target_position = player.global_transform.origin + Vector3(0, height_offset, 0)
	var direction = (target_position - global_transform.origin).normalized()

	velocity = direction * speed
	move_and_slide()
