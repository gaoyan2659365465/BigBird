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
