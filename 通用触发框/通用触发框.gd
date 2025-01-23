extends Node2D


@export var 事件名 = ""

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as Player:
		Global.通用触发框信号.emit(事件名)
