extends Control


var 屏幕文本 = """[center]

尊敬的鸟神啊"""

var 屏幕文本2 = """[center]

请你拯救
豆腐王国之子民"""

var 屏幕文本3 = """[center]

吾等愿献祭一切！！！"""


var 屏幕文本5 = """[center]
太棒了！继续下去！
不停点击屏幕
跳过这些管道！"""



func _ready() -> void:
	$RichTextLabel.text = 屏幕文本
	$AnimationPlayer.play("弹出对话")


func _on_texture_button_pressed() -> void:
	if $RichTextLabel.text == 屏幕文本:
		$RichTextLabel.text = 屏幕文本2
		$AnimationPlayer.play("弹出对话")
	elif $RichTextLabel.text == 屏幕文本2:
		$RichTextLabel.text = 屏幕文本3
		$AnimationPlayer.play("弹出对话")
	elif $RichTextLabel.text == 屏幕文本3:
		$RichTextLabel.text = ""
		$AnimationPlayer.play("隐藏背景")
