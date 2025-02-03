extends Control


@export var 倒计时 = 3

func _on_timer_timeout() -> void:
	var a = 倒计时 - 1
	if a >= 0:
		倒计时 = a
		$Label.text = str(倒计时)
	else:
		$Timer.stop()
		$Label.text = "点击领取"


func 创建资源收集动效():
	var dx = preload("res://游戏场景/获取资源动效/获取资源动效.tscn").instantiate()
	dx.position = get_window().size/2
	Global.umg.add_child(dx)
	queue_free()

func _on_texture_button_pressed() -> void:
	if 倒计时 == 0:
		创建资源收集动效()
