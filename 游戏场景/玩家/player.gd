class_name Player extends CharacterBody2D


# 定义重力、跳跃力度和水平速度
@export var gravity: float = 1000.0
@export var jump_force: float = 400.0
@export var max_fall_speed: float = 600.0
@export var horizontal_speed: float = 150.0

var 无敌时间 = false


func _ready():
	Global.play = self
	# 初始化主角状态
	velocity = Vector2.ZERO
	Global.player_save.set_引导流程.connect(_on_set_引导流程)
	Global.通用触发框信号.connect(_on_通用触发框信号)

func _on_set_引导流程(value):
	if value == 5:
		Global.player_save.禁用玩家操作 = false
	


func _physics_process(delta):
	if Global.player_save.禁用玩家操作:
		return
	# 检测跳跃输入
	if Input.is_action_just_pressed("ui_accept"): # 例如空格键或鼠标点击
		velocity.y = -jump_force
		Global.player_save.统计跳跃次数 += 1
		#$"大鸟".跳跃()
		if Global.player_save.引导流程 == 5:
			Global.player_save.引导流程 = 6
	# 添加重力
	velocity.y += gravity * delta

	# 限制最大下落速度
	if velocity.y > max_fall_speed:
		velocity.y = max_fall_speed
	
	# 处理水平移动（Flappy Bird中可以省略）
	velocity.x = horizontal_speed
	if is_on_floor():
		velocity.x = 0
	# 移动角色
	move_and_slide()


func _on_通用触发框信号(事件名):
	if 事件名 == "切换普通鸟":
		$Sprite2D.texture = preload("res://PSD源文件/普通鸟.png")
	if 事件名 == "切换冲刺鸟":
		$Sprite2D.texture = preload("res://PSD源文件/冲刺鸟.png")
	if 事件名 == "切换石化鸟":
		$Sprite2D.texture = preload("res://PSD源文件/石化鸟.png")
	if 事件名 == "切换彩虹鸟":
		$Sprite2D.texture = preload("res://PSD源文件/彩虹鸟.png")
	if 事件名 == "切换僵尸鸟":
		$Sprite2D.texture = preload("res://PSD源文件/僵尸鸟.png")
	if 事件名 == "切换酋长鸟":
		$Sprite2D.texture = preload("res://PSD源文件/酋长鸟.png")

func 受击():
	$AnimationPlayer.play("受击动画")
	无敌时间 = true
	await get_tree().create_timer(1.0).timeout
	无敌时间 = false
