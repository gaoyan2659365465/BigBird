extends Node2D





func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as Player:
		var cg = preload("res://游戏场景/股市/股市.tscn").instantiate()
		Global.umg.add_child(cg)
