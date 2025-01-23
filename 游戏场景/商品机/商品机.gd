extends Node2D


@export var 商品 = "红心"
@export var 价格 = 5
@export var 数量 = 1

func _ready() -> void:
	$Label.text = "$" + str(价格)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as Player:
		# 先看看钱够不够，再看看玩家是否缺心
		# 如果满心状态不能购买
		Global.信息框("金币不足，无法购买")
		Global.信息框("当前不缺少生命值，无法购买")
		pass


func 购买成功():
	$Label.text = "已售"
	$"红心".visible = false
