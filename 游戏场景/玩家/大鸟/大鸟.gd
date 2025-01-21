extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func 跳跃():
	animation_player.stop()
	animation_player.play("animations/飞")
