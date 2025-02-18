extends Node2D


var 已开启 = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as Player:
		if 已开启:
			return
		var djs = preload("res://游戏场景/倒计时资源/倒计时资源.tscn").instantiate()
		Global.umg.add_child(djs)
		djs.position = Vector2(1065,191)
		已开启 = true
		await get_tree().create_timer(1.0).timeout
		queue_free()
