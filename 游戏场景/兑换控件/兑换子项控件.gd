extends Control

@onready var 兑换按钮: 超级按钮 = $"兑换按钮"

func _ready() -> void:
	兑换按钮.focus_mode = FOCUS_NONE
