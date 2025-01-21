extends Area2D


signal 被碰到(target)

func _on_body_entered(body: Node2D) -> void:
	if body as Player:
		emit_signal("被碰到",body)
