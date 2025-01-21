extends Node2D


@onready var 视频转场: Control = $"CanvasLayer/视频转场"

@onready var 生命控件: Control = $"CanvasLayer/生命控件"

@onready var canvas_layer: CanvasLayer = $CanvasLayer


func _ready() -> void:
	# 运行时缩放窗口
	#if OS.get_name() == "Windows":
	#	get_window().size = Vector2i(648/1.2,1152/1.2)
	#	get_window().position = Vector2i(500,50)
	
	var n = Global.player_save.当前加载关卡
	初始化指定关卡(n)
	
	监听柱子被撞()# 需要等待所有柱子全部生成
	监听金币被撞()
	初始化相机框()
	
	Global.player_save.收集物品 = []
	
	视频转场.进入场景转场End()


func 监听柱子被撞():
	var zhus = get_tree().get_nodes_in_group("柱子")
	for i in zhus:
		i.connect("被碰到",_on_柱子_被碰到)
		i.connect("离开",_on_柱子_离开)

func 监听金币被撞():
	var jins = get_tree().get_nodes_in_group("金币")
	for i in jins:
		i.connect("吃金币",_on_金币_吃金币)

# 幻影相机需要玩家引用
func 初始化相机框():
	var 相机框 = get_tree().get_nodes_in_group("相机框")
	for i in 相机框:
		i.follow_target = $Player


func 初始化指定关卡(n):
	var level
	if n == 1 or n == 0:
		level = preload("res://游戏场景/关卡/第一关.tscn").instantiate()
	elif n == 2:
		level = preload("res://游戏场景/关卡/第二关.tscn").instantiate()
	add_child(level)
	move_child(level,0)
	level.过关.connect(_on_过关)


func _on_柱子_被碰到(target):
	Global.player_save.血量 -= 1

func _on_柱子_离开(target):
	Global.player_save.通过柱子数 += 1

func _on_金币_吃金币():
	Global.player_save.金币 += 1
	Global.player_save.收集物品.append("金币")
	Global.player_save.收集物品 = Global.player_save.收集物品  


func _on_生命控件_被撞死() -> void:
	var stop = preload("res://游戏场景/游戏结束控件/游戏结束控件.tscn").instantiate()
	canvas_layer.add_child(stop)

func _on_过关() -> void:
	Global.player_save.解锁关卡.append(2)
	var stop = preload("res://游戏场景/游戏胜利控件/游戏胜利控件.tscn").instantiate()
	canvas_layer.add_child(stop)


func _on_跳跃按钮控件_跳跃() -> void:
	Input.action_press("ui_accept")
	await get_tree().process_frame
	Input.action_release("ui_accept")
