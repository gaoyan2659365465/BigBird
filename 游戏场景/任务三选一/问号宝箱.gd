extends Sprite2D


signal 接取任务


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as Player:
		接取任务.emit()
		queue_free()
