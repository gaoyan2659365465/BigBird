extends Control


func _ready() -> void:
	get_tree().paused = true


func _on_返回按钮_点击动画结束() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://游戏场景/游戏场景.tscn")     
