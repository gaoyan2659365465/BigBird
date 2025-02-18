@tool
extends Node2D


@export var 显示文字:String = "通过第二关后解锁"
@export var 解锁ID:int = 0

@onready var sprite_2d: Sprite2D = $Sprite2D


@export var 长度:int = 100:
	set(v):
		长度 = v
		if sprite_2d:
			$Sprite2D.scale.x = v
			$Sprite2D.position.x = v/2 + 70


func _ready() -> void:
	$Label.text = 显示文字
	if not Engine.is_editor_hint():
		Global.player_save.set_大鸟部落解锁.connect(_on_大鸟部落解锁)


func 开始解锁():
	$"聚焦摄像头".priority = 11
	$AnimationPlayer.play("解锁")


func _on_大鸟部落解锁(v):
	print("---------------")
	print(v)
	if 解锁ID == v:
		开始解锁()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$"聚焦摄像头".priority = 0
