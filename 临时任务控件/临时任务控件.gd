extends Control

# 关卡内的临时任务，当离开关卡后消失



func _ready() -> void:
	Global.临时任务控件 = self


func 添加任务():
	visible = true
	

func 清空任务():
	pass
