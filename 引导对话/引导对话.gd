extends Control




@onready var rich_text_label: RichTextLabel = $CenterContainer/RichTextLabel


func _ready() -> void:
	Global.通用触发框信号.connect(_on_通用触发框信号)
	Global.player_save.set_引导流程.connect(_on_set_引导流程)
	await get_tree().process_frame
	Global.player_save.引导流程 = 12
	
func 切换文本(text):
	rich_text_label.text = text
	rich_text_label.pivot_offset = rich_text_label.size/2
	$AnimationPlayer.play("弹出对话")


func _on_texture_button_pressed() -> void:
	if Global.player_save.引导流程 == 0:
		await get_tree().create_timer(1.0).timeout
		Global.player_save.引导流程 = 1
	elif Global.player_save.引导流程 == 1:
		await get_tree().create_timer(1.0).timeout
		Global.player_save.引导流程 = 2
	elif Global.player_save.引导流程 == 2:
		await get_tree().create_timer(1.0).timeout
		Global.player_save.引导流程 = 3


func _on_通用触发框信号(事件名):
	if 事件名 == "引导6":
		rich_text_label.text = ""
	if 事件名 == "引导7":
		Global.player_save.引导流程 = 7
		Global.player_save.禁用玩家操作 = true
		await get_tree().create_timer(3.0).timeout
		Global.player_save.引导流程 = 8
		await get_tree().create_timer(1.0).timeout
		Global.player_save.禁用玩家操作 = false
	if 事件名 == "引导9":
		Global.player_save.引导流程 = 9
	if 事件名 == "引导10":
		if Global.player_save.引导流程 == 9:
			Global.player_save.引导流程 = 10
			for i in get_tree().get_nodes_in_group("传送点"):
				if i.唯一ID == 1:
					# 说明找到了引导关的传送点，需要绑定它的传送信号
					i.开始传送.connect(_on_引导关_开始传送)


func _on_set_引导流程(value):
	if value == 0:
		$ColorRect.visible = true
		var 屏幕文本 = """[center]尊敬的鸟神啊"""
		切换文本(屏幕文本)
	elif value == 1:
		var 屏幕文本 = """[center]请你拯救\n豆腐王国之子民"""
		切换文本(屏幕文本)
	elif value == 2:
		var 屏幕文本 = """[center]吾等愿献祭一切！！！"""
		切换文本(屏幕文本)
	elif value == 3:
		rich_text_label.text = ""
		$AnimationPlayer.play("隐藏背景")
	elif value == 5:
		var 屏幕文本 = """[center][color=#ff0000]点击屏幕[/color]控制大鸟飞起"""
		切换文本(屏幕文本)
	elif value == 6:
		await get_tree().create_timer(1.0).timeout
		var 屏幕文本 = """[center]\n太棒了！继续下去！\n不停[color=#ff0000]点击屏幕[/color]\n跳过这些[color=#ff0000]尖刺[/color]！"""
		切换文本(屏幕文本)
	elif value == 7:
		var 屏幕文本 = """[center]不愧是你\n轻松躲避了[color=#ff0000]尖刺[/color]"""
		切换文本(屏幕文本)
	elif value == 8:
		var 屏幕文本 = """[center]\n[color=#ffc60b]金币[/color]是个好东西\n多多益善\n继续前进"""
		切换文本(屏幕文本)
	elif value == 9:
		var 屏幕文本 = """[center]\n[color=#0059ff]传送门[/color]\n豆腐王国的最高科技\n前进激活它"""
		切换文本(屏幕文本)
	elif value == 10:
		var 屏幕文本 = """[center]\n进入[color=#0059ff]传送门[/color]\n能送你去想去的地方"""
		切换文本(屏幕文本)
	elif value == 11:
		var 屏幕文本 = """[center]\n就是这样\n这里是大鸟部落\n你的新家！"""
		切换文本(屏幕文本)
	elif value == 12:
		rich_text_label.text = ""
	

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "隐藏背景":
		Global.player_save.引导流程 = 4


func _on_引导关_开始传送():
	Global.player_save.引导流程 = 11
	await get_tree().create_timer(2.0).timeout
	Global.player_save.引导流程 = 12
