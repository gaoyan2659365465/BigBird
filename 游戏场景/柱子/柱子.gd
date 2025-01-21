extends Node2D


signal 被碰到(target)
signal 离开(target)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as Player:
		emit_signal("被碰到",body)


# 玩家离开柱子槽函数
func _on_area_2d_2_body_exited(body: Node2D) -> void:
	if body as Player:
		emit_signal("离开",body)
