extends Node3D

@export var required_coins := 12
@export var touching_flag := 2.0
@onready var player := get_node("/root/Main/Player")
var endgame_triggered := false

func _process(delta):
	if endgame_triggered:
		return
	
	if player.coins >= required_coins and global_transform.origin.distance_to(player.global_transform.origin) <= touching_flag:
		Dialogic.start("res://dialogic//timelines/end_timeline.dtl")
		endgame_triggered = true
