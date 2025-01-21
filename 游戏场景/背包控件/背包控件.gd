extends Control

@onready var grid_container: GridContainer = $GridContainer


func _ready() -> void:
	初始化背包格()
	Global.player_save.set_收集物品.connect(_on_收集物品)


func 初始化背包格():
	清空背包()
	for i in range(16):
		var bbg = preload("res://游戏场景/背包控件/背包格控件.tscn").instantiate()
		grid_container.add_child(bbg)

func 清空背包():
	for n in grid_container.get_children(): grid_container.remove_child(n) 

func 添加物品(value):
	var a = false
	for i in grid_container.get_children():
		if i.是否有物品 == false:
			i.是否有物品 = true
			a = true
			i.加载物品图标(value)
			break
	if not a:
		print("背包已满")
		Global.信息框("背包已满")


func _on_收集物品(value):
	初始化背包格()
	for i in value:
		添加物品(i)
