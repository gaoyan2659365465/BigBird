extends Node2D





func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as Player:
		var qd = preload("res://游戏场景/签到/签到控件.tscn").instantiate()
		Global.umg.add_child(qd)
