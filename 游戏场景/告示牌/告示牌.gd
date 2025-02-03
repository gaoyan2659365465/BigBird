class_name 告示牌 extends TextureButton


@export
var 告示牌名:String = "告示牌1"



# 如果第一次点击，则播放摇晃和感叹号特效
func _ready() -> void:
	
	# 没有被点击过才摇晃显示感叹号
	var is_ok = true
	for i in Global.player_save.告示牌被点击:
		if i == 告示牌名:
			is_ok = false
	if is_ok:
		$"感叹号特效".visible = true
		$AnimationPlayer.play("告示牌摇晃")


# 确保没有重复项
func 设置告示牌被点击(value):
	var is_ok = true
	for i in Global.player_save.告示牌被点击:
		if i == value:
			is_ok = false
	if is_ok:
		Global.player_save.告示牌被点击.append(value)
	
	
func _on_气泡关闭():
	# 切换剧情模式
	await Global.剧情镜头.离开剧情模式()


func _on_pressed() -> void:
	$"感叹号特效".visible = false
	
	# 停止消耗能量
	await Global.剧情镜头.进入剧情模式()
	
	var qp = preload("res://游戏场景/对话气泡/对话气泡.tscn").instantiate()
	qp.connect("关闭",_on_气泡关闭)
	Global.umg.add_child(qp)
	qp.告示牌名 = 告示牌名
	
	设置告示牌被点击(告示牌名)
	Global.saveResource()
