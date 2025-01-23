extends TextureButton

@export var 当前传送塔ID = 0
@export var 目标传送塔ID = 0

signal 开始传送(old_id,new_id)

func 初始化位置(pos):
	position = pos + Vector2(-32,-32)


func _on_pressed() -> void:
	print("开始传送到传送塔："+str(目标传送塔ID))
	var 传送塔数组 = get_tree().get_nodes_in_group("传送塔")
	for i in 传送塔数组:
		if i.传送塔ID == 目标传送塔ID:
			Global.play.global_position = i.global_position - Vector2(400,500)
			开始传送.emit(当前传送塔ID,目标传送塔ID)
			return
