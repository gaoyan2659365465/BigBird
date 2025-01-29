extends Control


func _ready() -> void:
	get_tree().paused = true

func _on_超级按钮_点击动画结束() -> void:
	get_tree().paused = false


func _on_重新开始按钮_点击动画结束() -> void:
	get_tree().paused = false
	queue_free()
	# 传送到大鸟部落
	for t in get_tree().get_nodes_in_group("传送目标"):
		if t.关卡名 == "大鸟部落":
			Global.play.global_position = t.global_position
