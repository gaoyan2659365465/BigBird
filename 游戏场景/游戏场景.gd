extends Node2D


@onready var 视频转场: Control = $"CanvasLayer/视频转场"

@onready var 生命控件: Control = $"CanvasLayer/生命控件"

@onready var canvas_layer: CanvasLayer = $CanvasLayer


func _ready() -> void:
	Global.player_save.set_引导流程.connect(_on_set_引导流程)
	
	Global.player_save.收集物品 = []
	
	视频转场.进入场景转场End()


func _on_生命控件_被撞死() -> void:
	var stop = preload("res://游戏场景/游戏结束控件/游戏结束控件.tscn").instantiate()
	canvas_layer.add_child(stop)
	Global.player_save.统计死亡次数 += 1


func _on_set_引导流程(value):
	if value == 4:
		$"聚焦摄像头".priority = 0
		await get_tree().create_timer(1.0).timeout
		Global.player_save.引导流程 = 5
	elif value > 4:
		$"聚焦摄像头".priority = 0
