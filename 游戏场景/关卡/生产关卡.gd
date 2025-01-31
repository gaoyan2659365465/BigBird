@tool
extends Node2D


@export var 关卡id = 1:
	set(v):
		关卡id = v


var 背景
var 柱子
var 相机框
var 传送点
var 传送目标


func _ready() -> void:
	var data
	if not Engine.is_editor_hint():
		data = Global.excel_data.关卡加载()
	else:
		var json = preload("res://数据存档/数据表/游戏数据表.json")
		data = json.data['关卡信息']
	for key in data:
		var 数据 = data[key]
		if 数据['ID'] == 关卡id:
			创建背景(数据['背景长度'], 数据['关卡名称'])
			创建柱子(数据['柱子数量'], 数据['柱子颜色'], 数据['柱子种子'])
			创建相机框(数据['背景长度'])
			创建传送点(数据['背景长度'], 数据['关卡名称'])
	


func 创建背景(长度,名称):
	背景 = preload("res://游戏场景/背景生成/背景生成.tscn").instantiate()
	add_child(背景)
	背景.关卡长度 = 长度
	背景.房间名 = 名称

func 创建柱子(数量,颜色,种子):
	柱子 = preload("res://游戏场景/柱子/柱子生成器.tscn").instantiate()
	add_child(柱子)
	柱子.柱子数量 = 数量
	柱子.柱子颜色 = Color(颜色)
	柱子.随机种子 = 种子

func 创建相机框(长度):
	相机框 = preload("res://幻影相机/camera_area.tscn").instantiate()
	add_child(相机框)
	相机框.collision_shape_2d.position = Vector2(长度/2, 1080/2)
	相机框.collision_shape_2d.shape.size = Vector2(长度,1080)

func 创建传送点(长度,名称):
	传送点 = preload("res://游戏场景/传送点/传送点.tscn").instantiate()
	add_child(传送点)
	传送点.position = Vector2(长度-1000,928)
	
	传送目标 = preload("res://游戏场景/传送点/传送目标.tscn").instantiate()
	add_child(传送目标)
	传送目标.position = Vector2(406,597)
	传送目标.关卡名 = 名称
