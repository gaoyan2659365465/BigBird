extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var 成就数据 = Global.excel_data.成就加载()
	for key in 成就数据:
		var data = 成就数据[key]
		var id = data['ID']
		var x = data['成就房间中的X坐标']
		var y = data['成就房间中的Y坐标']
		var 成就名 = data['成就名称']
		创建成就按钮(id,data['成就图标资源路径'], Vector2(int(x),int(y)), 成就名)


func 创建成就按钮(id,图片路径,位置,成就名):
	var 成就按钮 = preload("res://成就系统/成就按钮.tscn").instantiate()
	add_child(成就按钮)
	成就按钮.初始化成就(id,图片路径,成就名)
	成就按钮.position = 位置
