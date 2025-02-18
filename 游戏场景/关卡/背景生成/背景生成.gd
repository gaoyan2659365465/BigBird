@tool
extends Node2D

@export var 关卡长度 = 1920:
	set(v):
		关卡长度 = v
		更新关卡()

@export var gradient:Gradient = Gradient.new()


@export var 房间名:String = "未命名关卡"

var 背景
var 中景
var 碰撞
var 背景检测框:Area2D


signal 进入房间()


func _ready() -> void:
	创建背景()
	创建中景()
	创建碰撞()
	背景检测框.body_entered.connect(_on_body_entered)

func 创建背景():
	背景 = Sprite2D.new()
	var grad_tex = GradientTexture2D.new()
	#var gradient = Gradient.new()
	#gradient.set_color(0,Color("#2a78d1"))
	#gradient.set_color(1,Color("#87c3ff"))
	grad_tex.gradient = gradient
	grad_tex.width = 1
	grad_tex.height = 1080
	grad_tex.fill_from = Vector2(0.5,0)
	grad_tex.fill_to = Vector2(0.5,1)
	背景.texture = grad_tex
	add_child(背景)
	背景.scale = Vector2(关卡长度,1)
	背景.position = Vector2(关卡长度/2,1080/2)
	#背景.clip_children = CanvasItem.CLIP_CHILDREN_AND_DRAW
	背景.z_index = -1
	背景.z_as_relative = false
	
	背景检测框 = Area2D.new()
	add_child(背景检测框)
	var 区域 = CollisionShape2D.new()
	var shape = RectangleShape2D.new()
	shape.size = Vector2(关卡长度,1080)
	区域.shape = shape
	背景检测框.add_child(区域)
	区域.position = Vector2(关卡长度/2,1080/2)
	


func 创建中景():
	中景 = Sprite2D.new()
	var grad_tex = GradientTexture2D.new()
	var gradient = Gradient.new()
	gradient.set_color(0,Color("#000000"))
	gradient.set_color(1,Color("#000000"))
	grad_tex.gradient = gradient
	grad_tex.width = 1
	grad_tex.height = 160
	中景.texture = grad_tex
	add_child(中景)
	中景.scale = Vector2(关卡长度,1)
	中景.position = Vector2(关卡长度/2,1080-160/2)
	中景.z_index = 1

func 创建碰撞():
	碰撞 = StaticBody2D.new()# 天花板和地板
	var co = CollisionShape2D.new()
	var shape = RectangleShape2D.new()
	shape.size = Vector2(关卡长度,160)
	co.position = Vector2(关卡长度/2,160/2*-1)
	co.shape = shape
	var co2 = CollisionShape2D.new()
	var shape2 = RectangleShape2D.new()
	shape2.size = Vector2(关卡长度,160)
	co2.position = Vector2(关卡长度/2,1080-160/2)
	co2.shape = shape2
	碰撞.add_child(co)
	碰撞.add_child(co2)
	add_child(碰撞)


func 更新关卡():
	if 背景:
		背景.scale = Vector2(关卡长度,1)
		背景.position = Vector2(关卡长度/2,1080/2)
		背景检测框.get_child(0).shape.size = Vector2(关卡长度,1080)
		背景检测框.get_child(0).position = Vector2(关卡长度/2,1080/2)
	if 中景:
		中景.scale = Vector2(关卡长度,1)
		中景.position = Vector2(关卡长度/2,1080-160/2)
	if 碰撞:
		碰撞.get_child(0).shape.size = Vector2(关卡长度,160)
		碰撞.get_child(0).position = Vector2(关卡长度/2,160/2*-1)
		碰撞.get_child(1).shape.size = Vector2(关卡长度,160)
		碰撞.get_child(1).position = Vector2(关卡长度/2,1080-160/2)


func _on_body_entered(body:Node2D):
	if body as Player:
		# 玩家进入该房间，需要显示房间名
		Global.房间名(房间名)
		进入房间.emit()
