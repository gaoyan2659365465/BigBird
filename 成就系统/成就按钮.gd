extends Control

@onready var 成就图标: TextureButton = $"VBoxContainer/成就图标"
@onready var label: Label = $VBoxContainer/Label
@onready var 红点: TextureRect = $"红点"

var 成就ID = 0

func 初始化成就(id):
	成就ID = id
	position = Global.成就系统.获取位置(id)
	成就图标.texture_normal = load(Global.成就系统.获取图标路径(id))
	label.text = Global.成就系统.获取成就名称(id)
	刷新成就情况()
	
func 刷新成就情况():
	# 判断当前成就状态，是否有未领取的奖励
	var max_value = Global.成就系统.获取解锁条件参数(成就ID)
	var value = Global.成就系统.获取当前条件参数(成就ID)
	if value >= max_value:
		红点.visible = true
		成就图标.self_modulate = Color("#ffffff")
		for i in Global.player_save.统计成就领取奖励:
			if i == 成就ID:
				红点.visible = false
				label.set("theme_override_colors/font_color",Color("#ffdb00"))
	else:
		成就图标.self_modulate = Color("#414141")

func _on_成就图标_pressed() -> void:
	var 面板 = preload("res://成就系统/成就面板.tscn").instantiate()
	Global.umg.add_child(面板)
	面板.初始化成就面板(成就ID)
