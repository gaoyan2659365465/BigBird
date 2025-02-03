extends Control


func _ready() -> void:
	var t = Global.player_save.关卡_离开时间 - Global.player_save.关卡_进入时间
	%"用时".text = "关卡用时：" + str(ceil(t)) + "秒"
	%"柱子".text = "通过柱子：" + str(Global.player_save.关卡_通过柱子数) + "根"
	%"红心".text = "消耗红心：" + str(Global.player_save.关卡_消耗红心数) + "颗"
	%"评价".text = "综合评价：" + str(Global.player_save.关卡_评价)

func _on_button_pressed() -> void:
	queue_free()
