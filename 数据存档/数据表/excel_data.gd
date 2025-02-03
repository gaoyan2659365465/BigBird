class_name ExcelData extends Node

"""
# 获取数据
self.json.data['数据表名']
"""

# 用于加载Json数据
var json = preload("res://数据存档/数据表/游戏数据表.json")



func _ready() -> void:
	pass


func 成就加载():
	var 成就数据 = self.json.data['成就系统']
	return 成就数据

func 关卡加载():
	var 关卡数据 = self.json.data['关卡信息']
	return 关卡数据


func 获取对话(告示牌名 = "告示牌1"):
	var 对话数据 = self.json.data['对话数据']
	
	var 对话数组 = []
	for key in 对话数据:
		var 对话 = 对话数据[key][告示牌名]
		if 对话 != "":
			对话数组.append(对话)
		else:
			return 对话数组
	return 对话数组
