@tool
extends Node2D


signal 中途传送



func _on_确认离开():
	$"传送点".传送()
	中途传送.emit()


func _on_传送点_进入() -> void:
	var tc = preload("res://游戏场景/中途退出弹窗/中途退出弹窗.tscn").instantiate()
	Global.umg.add_child(tc)
	tc.确认离开.connect(_on_确认离开)
