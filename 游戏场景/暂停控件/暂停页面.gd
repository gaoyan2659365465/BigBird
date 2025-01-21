extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"暂停按钮".focus_mode = FOCUS_NONE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_暂停按钮_点击动画结束() -> void:
	get_tree().paused = not get_tree().paused
	if get_tree().paused:
		$AnimationPlayer.play("暂停")
	else:
		$AnimationPlayer.play("恢复")
