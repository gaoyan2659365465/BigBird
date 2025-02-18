extends Node2D


@onready var 视频转场: Control = $"CanvasLayer/视频转场"

@onready var 生命控件: Control = $"CanvasLayer/生命控件"

@onready var canvas_layer: CanvasLayer = $CanvasLayer


func _ready() -> void:
	# 运行时缩放窗口
	if OS.get_name() == "Windows":
		get_window().size = Vector2i(1152,648)
		get_window().position = Vector2i(500,50)
	
	Global.player_save.收集物品 = []
	
	视频转场.进入场景转场End()
	
	if Global.player_save.引导流程 == 12:
		$Player.position = Vector2(7696,562)


func _on_生命控件_被撞死() -> void:
	var stop = preload("res://游戏场景/游戏结束控件/游戏结束控件.tscn").instantiate()
	canvas_layer.add_child(stop)
	Global.player_save.统计死亡次数 += 1
