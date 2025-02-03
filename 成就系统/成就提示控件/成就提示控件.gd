extends Control


@onready var label: Label = $PanelContainer/MarginContainer/HBoxContainer/Label
@onready var texture_rect: TextureRect = $PanelContainer/MarginContainer/HBoxContainer/TextureRect



func _ready() -> void:
	await get_tree().create_timer(2.0).timeout
	queue_free()


func 初始化(data):
	label.text = "解锁成就:" + str(data['成就名称'])
	texture_rect.texture = load(Global.成就系统.获取图标路径(data['ID']))
	
