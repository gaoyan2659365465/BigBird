extends Node2D


@export var 传送塔ID = 0
@export var 传送列表:Array[int] = []#输入其他传送塔的ID，点击传送球可以传送

@onready var path_2d: Path2D = $Path2D

var 传送球列表 = []

var 是否激活 = false

signal 显示传送球(value)
signal 开始传送(old_id,new_id)

func _ready() -> void:
	创建传送球()


func 创建传送球():
	var 曲线长度 = path_2d.curve.get_baked_length()
	var 每段长度 = 曲线长度 / (传送列表.size()+1)
	var n = 1
	for i in 传送列表:
		var 点位置 = path_2d.curve.sample_baked(每段长度*n)
		var 传送球 = preload("res://游戏场景/传送塔/传送球.tscn").instantiate()
		add_child(传送球)
		传送球.当前传送塔ID = 传送塔ID
		传送球.目标传送塔ID = i
		传送球.初始化位置(点位置)
		传送球.modulate = Color(1.0,1.0,1.0,0.0)
		传送球.开始传送.connect(_on_传送球_开始传送)
		传送球列表.append(传送球)
		n+=1


func 激活传送塔():
	是否激活 = true
	$AnimationPlayer.play("激活传送塔")
	Global.信息框("解锁传送塔")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as Player:
		if not 是否激活:
			激活传送塔()



func _on_点击传送塔_toggled(toggled_on: bool) -> void:
	if not 是否激活:# 只有激活以后才能点击使用
		return
	self.显示传送球.emit(toggled_on)# 供其他地方用的信号
	# 传送球出现动画和消失动画
	var tween = create_tween()
	# 非阻塞模式
	tween.set_parallel(true)
	var 间隔 = 0.0
	for 传送球 in 传送球列表:
		if toggled_on:
			var pos = 传送球.position
			传送球.position = Vector2.ZERO
			传送球.modulate = Color(1.0,1.0,1.0,0.0)
			tween.tween_property(传送球,"position",pos,0.2).set_delay(间隔)
			tween.tween_property(传送球,"modulate",Color(1.0,1.0,1.0,1.0),0.2).set_delay(间隔)
		else:
			var pos = 传送球.position
			传送球.modulate = Color(1.0,1.0,1.0,1.0)
			tween.tween_property(传送球,"position",Vector2.ZERO,0.2).set_delay(间隔)
			tween.tween_property(传送球,"position",pos,0.01).set_delay(间隔+0.2)
			tween.tween_property(传送球,"modulate",Color(1.0,1.0,1.0,0.0),0.2).set_delay(间隔)
		间隔 += 0.05


func _on_传送球_开始传送(old_id,new_id):
	# 所有当前塔的信号都集中在一起，方便管理
	self.开始传送.emit(old_id,new_id)
