@tool
extends Node2D


@export var 柱子颜色:Color = Color(1,1,1):
	set(v):
		柱子颜色 = v
		$"柱子上".self_modulate = v
		$"柱子下".self_modulate = v


signal 被碰到(target)
signal 离开(target)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as Player:
		emit_signal("被碰到",body)
		Global.player_save.统计红心消耗 += 1


# 玩家离开柱子槽函数
func _on_area_2d_2_body_exited(body: Node2D) -> void:
	if body as Player:
		emit_signal("离开",body)
		Global.player_save.统计穿过管道次数 += 1
