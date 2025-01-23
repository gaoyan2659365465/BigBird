class_name CameraArea2D extends Area2D

@onready var phantom_camera_2d: PhantomCamera2D = $PhantomCamera2D
@export var follow_target: Node2D = null:
	set(value):
		follow_target = value
		phantom_camera_2d.follow_target = follow_target

func _ready() -> void:
	await get_tree().process_frame
	if follow_target == null:
		follow_target = Global.play
	phantom_camera_2d.follow_target = follow_target

func _on_body_entered(body: Node2D) -> void:
	if body as Player:
		phantom_camera_2d.set_priority(10)


func _on_body_exited(body: Node2D) -> void:
	if body as Player:
		phantom_camera_2d.set_priority(0)
