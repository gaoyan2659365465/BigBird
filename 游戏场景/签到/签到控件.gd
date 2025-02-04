extends Control


@onready var v_box_container: VBoxContainer = $PanelContainer/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer

var 当天签到子项


func _ready() -> void:
	# 查看当前签到多少天
	var day = Global.player_save.sign_in_days
	
	var qd = 今天是否签到()
	
	# 动态添加子项
	for i in range(10):
		var item = preload("res://游戏场景/签到/签到子项.tscn").instantiate()
		item.签到点击.connect(_on_签到点击)
		v_box_container.add_child(item)
		item.设置文字(i+1)
		if i < day:
			item.领取()
		elif i == day:
			# 先存一下备用
			当天签到子项 = item
			if qd:
				item.禁用()
		elif i > day:
			item.禁用()


func 今天是否签到():
	var time = Time.get_date_dict_from_system()
	var sign_in_data = Global.player_save.sign_in_data
	for i in sign_in_data:
		if i == time:
			return true
	return false



func _on_点击关闭_pressed() -> void:
	queue_free()


func _on_签到点击():
	var time = Time.get_date_dict_from_system()
	Global.player_save.sign_in_data.append(time)
	# 存档中签到天数加1
	Global.player_save.sign_in_days = Global.player_save.sign_in_days + 1
	Global.saveResource()
	print("领取成功")
