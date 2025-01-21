extends Camera2D


# 鼠标按下时的位置
var pressed_mouse_pos = Vector2.ZERO
var camera_pos = Vector2.ZERO

var 拖动速度 = 0.0

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		self.pressed_mouse_pos = event.position
		self.camera_pos = self.position
	if event is InputEventScreenDrag:
		var mouse_offset = event.position - self.pressed_mouse_pos
		self.position = self.camera_pos - mouse_offset
		self.position.x = 0
	
	if position.y > 0:
		position.y = 0
	if position.y <= -2000:
		position.y = -2000
