extends Node2D


var 关卡


func 生成关卡(关卡id):
	if 关卡:
		关卡.queue_free()
	# 生成相应的关卡
	关卡 = preload("res://游戏场景/关卡/生产关卡.tscn").instantiate()
	关卡.关卡id = 关卡id
	get_parent().add_child(关卡)
	关卡.position = Vector2(0,3000)

func _on_背景生成_进入房间() -> void:
	if Global.player_save.血量 == 0:
		Global.player_save.血量 = 3
	
	var 关卡id = Global.player_save.解锁关卡
	var data = Global.excel_data.关卡加载()
	for key in data:
		var 数据 = data[key]
		if 数据['ID'] == 关卡id:
			$"传送点".传送目标 = 数据['关卡名称']
	
	call_deferred("生成关卡",关卡id)
	
	解锁大鸟部落()


func 解锁大鸟部落():
	await get_tree().create_timer(1.0).timeout
	if Global.player_save.解锁关卡 == 2:
		Global.player_save.大鸟部落解锁 = 1
	if Global.player_save.解锁关卡 == 3:
		Global.player_save.大鸟部落解锁 = 2
	if Global.player_save.解锁关卡 == 4:
		Global.player_save.大鸟部落解锁 = 3
