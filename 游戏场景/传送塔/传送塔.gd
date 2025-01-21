extends Node2D


func 激活传送塔():
	$AnimationPlayer.play("激活传送塔")
	Global.信息框("解锁传送塔")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as Player:
		激活传送塔()
