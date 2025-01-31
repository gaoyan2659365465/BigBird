extends Node2D


var 成就按钮列表 = []

func _ready() -> void:
	await get_tree().process_frame
	Global.player_save.领取成就奖励.connect(_on_领取成就奖励)
	
	for i in range(Global.成就系统.获取数量()):
		创建成就按钮(i+1)
	
	


func 创建成就按钮(id):
	var 成就按钮 = preload("res://成就系统/成就按钮.tscn").instantiate()
	add_child(成就按钮)
	成就按钮.初始化成就(id)
	成就按钮列表.append(成就按钮)


func _on_领取成就奖励():
	for i in 成就按钮列表:
		i.刷新成就情况()

func _on_背景生成_进入房间() -> void:
	for i in 成就按钮列表:
		i.刷新成就情况()
