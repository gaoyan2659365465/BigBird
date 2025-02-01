extends Control

@onready var v_box_container: VBoxContainer = $ScrollContainer/VBoxContainer



func _ready() -> void:
	var data = Global.excel_data.关卡加载()
	for key in data:
		var 数据 = data[key]
		var bt = Button.new()
		bt.focus_mode = Control.FOCUS_NONE
		bt.name = 数据['关卡名称']
		bt.text = 数据['关卡名称']
		bt.pressed.connect(_on_切换关卡.bind(数据['关卡名称']))
		v_box_container.add_child(bt)


func 传送(名字):
	for t in get_tree().get_nodes_in_group("传送目标"):
		if t.关卡名 == 名字:
			Global.play.global_position = t.global_position

func _on_大鸟部落_pressed() -> void:
	传送("大鸟部落")


func _on_成就房_pressed() -> void:
	传送("成就房")


func _on_角色切换房_pressed() -> void:
	传送("角色切换房")


func _on_切换关卡(v):
	传送(v)
