extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var d = randf_range(0.0,1.0)
	await get_tree().create_timer(d).timeout
	$AnimationPlayer.play("摇晃")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
