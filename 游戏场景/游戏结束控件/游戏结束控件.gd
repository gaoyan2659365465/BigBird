extends Control


func _ready() -> void:
	get_tree().paused = true

func _on_超级按钮_点击动画结束() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://选关场景/选关场景.tscn")


func _on_重新开始按钮_点击动画结束() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://游戏场景/游戏场景.tscn")
