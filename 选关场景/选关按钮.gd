extends Node2D


@export var 是否锁定 = true:
	set(v):
		是否锁定 = v
		if 关卡按钮:
			锁定切换()

enum 关卡列表{
	第一关,
	第二关,
	第三关,
	第四关,
	第五关,
	第六关,
	第七关,
	第八关,
}

@export var Level : 关卡列表

@onready var 关卡按钮: 超级按钮 = $"关卡按钮"
@onready var 锁定图标: Sprite2D = $"锁定图标"


signal 点击关卡(n)

func _ready() -> void:
	锁定切换()


func 锁定切换():
	if 是否锁定:
		关卡按钮.modulate = Color("#575757")
		锁定图标.visible = true
	else:
		关卡按钮.modulate = Color("#FFFFFF")
		锁定图标.visible = false




func _on_texture_button_点击动画结束() -> void:
	if 是否锁定:
		Global.信息框("关卡未解锁")
	else:
		emit_signal("点击关卡",Level)
