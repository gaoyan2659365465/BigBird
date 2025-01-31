
extends Node2D



signal 过关


func _on_背景生成_进入房间() -> void:
	Global.player_save.通过柱子数 = 0
	Global.player_save.最大柱子数 = 15
