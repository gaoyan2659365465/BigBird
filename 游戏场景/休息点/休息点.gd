extends Node2D





func _on_传送点_开始传送() -> void:
	var tc = preload("res://游戏场景/中途退出弹窗/中途退出弹窗.tscn").instantiate()
	Global.umg.add_child(tc)
	tc.确认离开.connect(_on_确认离开)


func _on_确认离开():
	$"传送点".传送()
