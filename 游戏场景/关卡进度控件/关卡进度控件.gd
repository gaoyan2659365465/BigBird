extends Control



func _ready() -> void:
	Global.player_save.set_通过柱子数.connect(_on_通过柱子数)
	await get_tree().process_frame# 等一帧关卡生成以后才会有最大柱子数
	_on_通过柱子数(Global.player_save.通过柱子数)


func _on_通过柱子数(n):
	$Label.text = "当前进度：" + str(n) + "/" + str(Global.player_save.最大柱子数)
