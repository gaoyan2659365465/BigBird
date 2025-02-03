extends Control


func _ready() -> void:
	Global.剧情镜头 = self

# 进入剧情模式，上下出现屏幕黑色边
func 进入剧情模式():
	Global.play.play_anim()
	$AnimationPlayer.play("进入镜头")
	await $AnimationPlayer.animation_finished

# 离开剧情模式，上下屏幕黑色边消失
func 离开剧情模式():
	# 切换相机
	Global.play.play_anim2()
	$AnimationPlayer.play_backwards("进入镜头")
	await $AnimationPlayer.animation_finished
