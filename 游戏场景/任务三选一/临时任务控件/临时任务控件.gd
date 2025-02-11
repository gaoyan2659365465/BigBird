extends Control


@onready var texture_button: TextureButton = $VBoxContainer/TextureButton
@onready var texture_button_2: TextureButton = $VBoxContainer/TextureButton2
@onready var texture_button_3: TextureButton = $VBoxContainer/TextureButton3

var bt_list = []

func _ready() -> void:
	bt_list = [texture_button,texture_button_2,texture_button_3]

func 添加任务():
	for i in bt_list:
		if i.visible == false:
			i.visible = true
			return
