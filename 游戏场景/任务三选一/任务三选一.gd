extends Node2D

var rw

func _ready() -> void:
	rw = preload("res://游戏场景/任务三选一/临时任务控件/临时任务控件.tscn").instantiate()
	Global.umg.add_child(rw)


func _on_问号宝箱1_接取任务() -> void:
	rw.添加任务()


func _on_问号宝箱2_接取任务() -> void:
	rw.添加任务()


func _on_问号宝箱3_接取任务() -> void:
	rw.添加任务()

func _exit_tree() -> void:
	rw.queue_free()
