extends TextureButton


func _process(delta: float) -> void:
	var tran = get_canvas_transform()
	var new_pos = Vector2(0,0) * tran
	
	position = new_pos
	size = Vector2(1920,1080)


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed:
			if event.position.x >= 1920/2:
				Global.play.跳跃(true)
			else:
				Global.play.跳跃(false)
