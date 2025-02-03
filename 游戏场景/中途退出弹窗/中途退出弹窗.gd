extends Control


signal 确认离开


func _on_button_2_pressed() -> void:
	queue_free()


func _on_button_pressed() -> void:
	确认离开.emit()
	queue_free()
