extends Node2D


@onready var 视频转场: Control = $"CanvasLayer/视频转场"

@onready var 生命控件: Control = $"CanvasLayer/生命控件"

@onready var canvas_layer: CanvasLayer = $CanvasLayer


func _ready() -> void:
	# 运行时缩放窗口
	#if OS.get_name() == "Windows":
	#	get_window().size = Vector2i(648/1.2,1152/1.2)
	#	get_window().position = Vector2i(500,50)
	Global.player_save.set_引导流程.connect(_on_set_引导流程)
	
	Global.player_save.收集物品 = []
	
	视频转场.进入场景转场End()




func _on_生命控件_被撞死() -> void:
	var stop = preload("res://游戏场景/游戏结束控件/游戏结束控件.tscn").instantiate()
	canvas_layer.add_child(stop)
	Global.player_save.统计死亡次数 += 1


func _on_跳跃按钮控件_跳跃() -> void:
	Input.action_press("ui_accept")
	await get_tree().process_frame
	Input.action_release("ui_accept")


func _on_set_引导流程(value):
	if value == 4:
		$"聚焦摄像头".priority = 0
		await get_tree().create_timer(1.0).timeout
		Global.player_save.引导流程 = 5
	elif value > 4:
		$"聚焦摄像头".priority = 0
