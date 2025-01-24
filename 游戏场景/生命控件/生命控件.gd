extends Control


@onready var h_box_container: HBoxContainer = $HBoxContainer

signal 被撞死

func _ready() -> void:
	初始化红心(Global.player_save.血量)
	Global.player_save.set_血量.connect(_on_血量改变)


func 初始化红心(n:int):
	for i in range(n):
		var xin = preload("res://游戏场景/生命控件/心.tscn").instantiate()
		h_box_container.add_child(xin)


func _on_血量改变(hp):
	# 先删除所有心再根据血量重新生成
	# 后续如果有其他种类的心再说，比如黑心，灰心
	var xins = h_box_container.get_children()
	for i in xins:
		i.queue_free()
	初始化红心(hp)
	if hp == 0:
		被撞死.emit()
