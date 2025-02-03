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
var 休息点


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
			创建背景(数据['背景长度'], 数据['关卡名称'], 数据['背景颜色1'], 数据['背景颜色2'])
			创建柱子(数据['柱子数量'], 数据['柱子颜色'], 数据['柱子种子'])
			创建相机框(数据['背景长度'])
			创建传送点(数据['背景长度'], 数据['关卡名称'])
			创建休息点(数据['休息区位置'])
	
	Global.player_save.关卡_关卡ID = 关卡id
	Global.player_save.关卡_进入时间 = Time.get_unix_time_from_system()


func 创建背景(长度,名称,颜色1,颜色2):
	背景 = preload("res://游戏场景/背景生成/背景生成.tscn").instantiate()
	add_child(背景)
	背景.关卡长度 = 长度
	背景.房间名 = 名称
	背景.gradient.set_color(0,颜色1)
	背景.gradient.set_color(1,颜色2)
	

func 创建柱子(数量,颜色,种子):
	柱子 = preload("res://游戏场景/柱子/柱子生成器.tscn").instantiate()
	add_child(柱子)
	柱子.柱子数量 = 数量
	柱子.柱子颜色 = Color(颜色)
	柱子.随机种子 = 种子
	柱子.柱子通过.connect(_on_柱子通过)
	柱子.柱子被碰到.connect(_on_柱子被碰到)

func 创建相机框(长度):
	相机框 = preload("res://幻影相机/camera_area.tscn").instantiate()
	add_child(相机框)
	相机框.collision_shape_2d.position = Vector2(长度/2, 1080/2)
	相机框.collision_shape_2d.shape.size = Vector2(长度,1050)

func 创建传送点(长度,名称):
	传送点 = preload("res://游戏场景/传送点/传送点.tscn").instantiate()
	add_child(传送点)
	传送点.position = Vector2(长度-1000,928)
	传送点.进入.connect(_on_进入传送点)
	传送点.默认启用 = false
	
	传送目标 = preload("res://游戏场景/传送点/传送目标.tscn").instantiate()
	add_child(传送目标)
	传送目标.position = Vector2(406,597)
	传送目标.关卡名 = 名称

func 创建休息点(位置):
	var pos = 柱子.创建空地([位置,位置+1,位置+2])
	休息点 = preload("res://游戏场景/休息点/休息点.tscn").instantiate()
	add_child(休息点)
	休息点.position = pos
	休息点.position.x -= 50
	休息点.position.y = 0
	休息点.中途传送.connect(_on_休息点_中途传送)


func _on_进入传送点():
	Global.player_save.解锁关卡 = 关卡id + 1
	Global.player_save.关卡_是否通过 = true
	Global.player_save.关卡_离开时间 = Time.get_unix_time_from_system()
	
	var shengli = preload("res://游戏场景/游戏胜利控件/游戏胜利控件.tscn").instantiate()
	Global.umg.add_child(shengli)
	await shengli.tree_exiting
	传送点.传送()
	

func _on_柱子通过(target):
	Global.player_save.关卡_通过柱子数 += 1

func _on_柱子被碰到(target):
	Global.player_save.关卡_消耗红心数 += 1

func _on_休息点_中途传送():
	Global.player_save.关卡_是否通过 = false
	Global.player_save.关卡_离开时间 = Time.get_unix_time_from_system()
