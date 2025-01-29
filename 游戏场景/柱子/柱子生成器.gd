@tool
extends Node2D


@export var 柱子数量 = 1:
	set(v):
		柱子数量 = v
		创建柱子()

@export var 柱子颜色:Color = Color(1,1,1):
	set(v):
		柱子颜色 = v
		更新关卡()

@export var 随机种子:int = 0:
	set(v):
		随机种子 = v
		创建柱子()


var 柱子列表 = []


func _ready() -> void:
	创建柱子()


func 创建柱子():
	for i in 柱子列表:
		i.queue_free()
	柱子列表.clear()
	var pos = Vector2(400,0)
	seed(随机种子)# 随机种子
	for i in range(柱子数量):
		var 柱子 = preload("res://游戏场景/柱子/柱子.tscn").instantiate()
		add_child(柱子)
		柱子列表.append(柱子)
		var _y = randi_range(100,800)
		var 差 = abs(pos.y - _y)
		var 最近距离 = remap(差,0,653,167,540)
		var _x = randi_range(最近距离,最近距离+150)
		
		pos = Vector2(pos.x+_x,_y)
		柱子.position = pos
		柱子.柱子颜色 = 柱子颜色


func 更新关卡():
	for i in 柱子列表:
		i.柱子颜色 = 柱子颜色
