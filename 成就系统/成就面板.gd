extends Control


@onready var 成就名: Label = $"Panel/MarginContainer/VBoxContainer/成就名"
@onready var 成就描述: Label = $"Panel/MarginContainer/VBoxContainer/成就描述"
@onready var 成就奖励: Label = $"Panel/MarginContainer/VBoxContainer/成就奖励"
@onready var progress_bar: ProgressBar = $Panel/MarginContainer/VBoxContainer/ProgressBar
@onready var 领取奖励: Button = $"Panel/MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/领取奖励"


var 成就ID = 0


func 初始化成就面板(id):
	成就ID = id
	成就名.text = "成就名称：" + str(Global.成就系统.获取成就名称(id))
	成就描述.text = "成就描述：" + str(Global.成就系统.获取成就描述(id))
	成就奖励.text = "成就奖励：" + str(Global.成就系统.获取成就奖励(id))
	progress_bar.max_value = Global.成就系统.获取解锁条件参数(id)
	progress_bar.value = Global.成就系统.获取当前条件参数(id)
	
	if progress_bar.value >= progress_bar.max_value:
		领取奖励.text = "领取奖励"
		领取奖励.disabled = false
	
	# 判断这个成就是否领取过奖励
	var is_领取 = false
	for i in Global.player_save.统计成就领取奖励:
		if i == 成就ID:
			is_领取 = true
			领取奖励.text = "已领取"
			领取奖励.disabled = true
	
	
func _on_button_pressed() -> void:
	queue_free()# 关闭成就面板


func _on_领取奖励_pressed() -> void:
	# 去除重复项
	if progress_bar.value >= progress_bar.max_value:
		Global.player_save.统计成就领取奖励.append(成就ID)
		Global.player_save.领取成就奖励.emit()
		queue_free()
		Global.信息框("奖励已领取！")
