class_name 成就管理器 extends Node

var 成就数据:Dictionary

signal 达成成就(id)

func _ready() -> void:
	await get_tree().process_frame
	成就数据 = Global.excel_data.成就加载()
	Global.player_save.set_统计死亡次数.connect(_on_统计死亡次数)
	Global.player_save.set_统计红心收集.connect(_on_统计红心收集)
	Global.player_save.set_统计红心消耗.connect(_on_统计红心消耗)
	Global.player_save.set_统计金币总数.connect(_on_统计金币总数)
	Global.player_save.set_统计穿过管道次数.connect(_on_统计穿过管道次数)
	Global.player_save.set_统计最高通关.connect(_on_统计最高通关)
	Global.player_save.set_穿过鬼打墙.connect(_on_穿过鬼打墙)
	


func 获取数量():
	return 成就数据.keys().size()

func 获取位置(id):
	for key in 成就数据:
		var data = 成就数据[key]
		if id == data['ID']:
			var x = data['成就房间中的X坐标']
			var y = data['成就房间中的Y坐标']
			return Vector2(int(x),int(y))

func 获取图标路径(id):
	for key in 成就数据:
		var data = 成就数据[key]
		if id == data['ID']:
			return data['成就图标资源路径']

func 获取成就名称(id):
	for key in 成就数据:
		var data = 成就数据[key]
		if id == data['ID']:
			return data['成就名称']

func 获取成就描述(id):
	for key in 成就数据:
		var data = 成就数据[key]
		if id == data['ID']:
			return data['成就描述']

func 获取成就奖励(id):
	for key in 成就数据:
		var data = 成就数据[key]
		if id == data['ID']:
			return data['奖励物品ID']

func 获取解锁条件参数(id):
	for key in 成就数据:
		var data = 成就数据[key]
		if id == data['ID']:
			return data['解锁条件参数']

func 获取当前条件参数(id):
	for key in 成就数据:
		var data = 成就数据[key]
		if id == data['ID']:
			var value = data['解锁条件类型']
			print(value + ":" + str(Global.player_save.get(value)))
			return Global.player_save.get(value)
			

func 判断成就是否已达成(id):
	for i in Global.player_save.统计已达成成就:
		if i == id:
			return true
	return false

func 成就检测(id_list):
	for id in id_list:
		for key in 成就数据:
			var data = 成就数据[key]
			if id == data['ID']:
				var value_name = data['解锁条件类型']
				var value = Global.player_save.get(value_name)
				if value >= data['解锁条件参数']:
					if not 判断成就是否已达成(id):
						达成成就.emit(id)
						Global.player_save.统计已达成成就.append(id)
						Global.成就解锁(data)
						print("解锁成就:"+str(id))

func _on_统计死亡次数(v):
	成就检测([10,11,12])

func _on_统计红心收集(v):
	成就检测([4,5,6])

func _on_统计红心消耗(v):
	成就检测([])

func _on_统计金币总数(v):
	成就检测([7,8,9])

func _on_统计穿过管道次数(v):
	成就检测([1,2,3])

func _on_统计最高通关(v):
	成就检测([13,14,15,16])

func _on_穿过鬼打墙(v):
	成就检测([17])
