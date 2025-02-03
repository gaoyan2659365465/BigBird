extends Node2D


@export var 传送位置:Vector2 = Vector2.ZERO


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as Player:
		body.position = get_parent().position + 传送位置
		Global.player_save.穿过鬼打墙 = 1
