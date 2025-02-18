extends Node2D



func _ready() -> void:
	Global.player_save.set_引导流程.connect(_on_set_引导流程)


func _on_set_引导流程(value):
	if value < 4:
		$"聚焦摄像头".priority = 11
		Global.player_save.禁用玩家操作 = true
	if value == 4:
		Global.player_save.禁用玩家操作 = false
		$"聚焦摄像头".priority = 0
		await get_tree().create_timer(1.0).timeout
		Global.player_save.引导流程 = 5
	elif value > 4:
		$"聚焦摄像头".priority = 0
