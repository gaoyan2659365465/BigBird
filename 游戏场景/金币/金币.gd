extends Node2D


signal 吃金币


func _on_area_2d_body_entered(body: Node2D) -> void:
	吃金币.emit()
	Global.player_save.统计金币总数 += 1
	Global.player_save.金币 += 1
	Global.player_save.收集物品.append("金币")
	Global.player_save.收集物品 = Global.player_save.收集物品  
	queue_free()
