extends Panel


var 是否有物品 = false
@onready var 物品图标: TextureRect = $"物品图标"


func 加载物品图标(value):
	if value == "金币":
		var img = preload("res://PSD源文件/coin/coin-front-shine-logo.png")
		$"物品图标".texture = img
		
