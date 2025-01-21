extends Control


@onready var privacy: Privacy = $Privacy
@onready var 视频转场: Control = $"视频转场"


func _ready() -> void:
	视频转场.进入游戏转场()



func _on_开始游戏_点击动画结束() -> void:
	# 如果勾选了用户协议和隐私政策就进入游戏
	if privacy.isCheck():
		await 视频转场.进入场景转场Start()
		get_tree().change_scene_to_file("res://选关场景/选关场景.tscn")
