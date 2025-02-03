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
var 任务三选一

signal 柱子通过(target)
signal 柱子被碰到(target)


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
		柱子.离开.connect(_on_柱子通过)
		柱子.被碰到.connect(_on_柱子被碰到)
	
	创建三选一任务()


func 更新关卡():
	for i in 柱子列表:
		i.柱子颜色 = 柱子颜色


func 创建三选一任务():
	if 任务三选一:
		任务三选一.queue_free()
	if 柱子数量>5:
		seed(随机种子)# 随机种子
		var max_value = randi_range(1, 柱子数量 - 5)
		max_value = 2
		柱子列表[max_value].queue_free()
		任务三选一 = preload("res://游戏场景/任务三选一/任务三选一.tscn").instantiate()
		add_child(任务三选一)
		任务三选一.position = 柱子列表[max_value].position
		任务三选一.position.y = 469

func 创建空地(value):
	var pos = 柱子列表[value[0]].position
	for i in value:
		柱子列表[i].queue_free()
	return pos
	

func _on_柱子通过(target):
	柱子通过.emit(target)

func _on_柱子被碰到(target):
	柱子被碰到.emit(target)
