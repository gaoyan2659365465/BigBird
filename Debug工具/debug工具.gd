extends Control


func 传送(名字):
	for t in get_tree().get_nodes_in_group("传送目标"):
		if t.关卡名 == 名字:
			Global.play.global_position = t.global_position

func _on_大鸟部落_pressed() -> void:
	传送("大鸟部落")


func _on_成就房_pressed() -> void:
	传送("成就房")


func _on_角色切换房_pressed() -> void:
	传送("角色切换房")


func _on_第一关_pressed() -> void:
	传送("第一关")


func _on_第二关_pressed() -> void:
	传送("第二关")


func _on_第三关_pressed() -> void:
	传送("第三关")
