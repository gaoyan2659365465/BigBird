@tool
extends Node2D

@export var 关卡长度 = 1920:
	set(v):
		关卡长度 = v
		更新关卡()

@export var gradient:Gradient = Gradient.new()


var 背景
var 中景
var 碰撞

signal 过关


func _ready() -> void:
	if not Engine.is_editor_hint():
		Global.player_save.通过柱子数 = 0
		Global.player_save.最大柱子数 = 10
	创建背景()
	创建中景()
	创建碰撞()

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
	背景.clip_children = CanvasItem.CLIP_CHILDREN_AND_DRAW
	背景.z_index = -1
	背景.z_as_relative = false


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
	if 中景:
		中景.scale = Vector2(关卡长度,1)
		中景.position = Vector2(关卡长度/2,1080-160/2)
	if 碰撞:
		碰撞.get_child(0).shape.size = Vector2(关卡长度,160)
		碰撞.get_child(0).position = Vector2(关卡长度/2,160/2*-1)
		碰撞.get_child(1).shape.size = Vector2(关卡长度,160)
		碰撞.get_child(1).position = Vector2(关卡长度/2,1080-160/2)
