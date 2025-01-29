extends Control

@onready var 成就图标: TextureButton = $"VBoxContainer/成就图标"
@onready var label: Label = $VBoxContainer/Label

var 成就ID = 0

func 初始化成就(ID,图标路径,成就名):
	成就ID = ID
	成就图标.texture_normal = load(图标路径)
	label.text = 成就名


func _on_成就图标_pressed() -> void:
	var 面板 = preload("res://成就系统/成就面板.tscn").instantiate()
	Global.umg.add_child(面板)
	面板.初始化成就面板(成就ID)
