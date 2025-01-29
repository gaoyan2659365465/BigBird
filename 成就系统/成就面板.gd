extends Control


@onready var 成就名: Label = $"Panel/MarginContainer/VBoxContainer/成就名"
@onready var 成就描述: Label = $"Panel/MarginContainer/VBoxContainer/成就描述"




func 初始化成就面板(id):
	var 成就数据 = Global.excel_data.成就加载()
	for key in 成就数据:
		var data = 成就数据[key]
		var _id = data['ID']
		if id == _id:
			成就名.text = "成就名称：" + str(data['成就名称'])
			成就描述.text = "成就描述：" + str(data['成就描述'])


func _on_button_pressed() -> void:
	queue_free()# 关闭成就面板
