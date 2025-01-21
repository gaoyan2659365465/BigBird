extends Node2D


signal 过关


func _on_通关触发框_被碰到(target: Variant) -> void:
	emit_signal("过关")
	Global.player_save.通过柱子数 = 0
	Global.player_save.最大柱子数 = 10


func _ready() -> void:
	Global.player_save.通过柱子数 = 0
	Global.player_save.最大柱子数 = 10
