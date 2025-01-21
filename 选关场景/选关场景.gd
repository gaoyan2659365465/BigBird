extends Node2D


@onready var 视频转场: Control = $"Camera2D/视频转场"



func _ready() -> void:
	解锁关卡()
	视频转场.进入场景转场End()


func _on_选关按钮_点击关卡(n: Variant) -> void:
	Global.player_save.当前加载关卡 = n + 1
	await 视频转场.进入场景转场Start()
	get_tree().change_scene_to_file("res://游戏场景/游戏场景.tscn")


func 解锁关卡():
	var gq = Global.player_save.解锁关卡
	for i in gq:
		if i == 1:
			$"选关按钮".是否锁定 = false
		if i == 2:
			$"选关按钮2".是否锁定 = false
		if i == 3:
			$"选关按钮3".是否锁定 = false
		if i == 4:
			$"选关按钮4".是否锁定 = false
		if i == 5:
			$"选关按钮5".是否锁定 = false
		if i == 6:
			$"选关按钮6".是否锁定 = false
		if i == 7:
			$"选关按钮7".是否锁定 = false
		if i == 8:
			$"选关按钮8".是否锁定 = false
