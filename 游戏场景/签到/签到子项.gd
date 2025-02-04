extends PanelContainer

@onready var label: Label = $MarginContainer/HBoxContainer/Label
@onready var button: Button = $MarginContainer/HBoxContainer/Button


@export var text:String = ""

signal 签到点击

func 设置文字(_text):
	text = "第"+str(_text)+"天"
	label.text = text


func 领取():
	button.text = "已领取"
	button.disabled = true

func 禁用():
	button.text = "明天再来"
	button.disabled = true


func _on_button_pressed() -> void:
	领取()
	签到点击.emit()
