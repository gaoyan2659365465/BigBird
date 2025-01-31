extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_背景生成_进入房间() -> void:
	if Global.player_save.血量 == 0:
		Global.player_save.血量 = 1
