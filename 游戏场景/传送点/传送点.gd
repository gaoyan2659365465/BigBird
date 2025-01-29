extends Node2D


@export var 传送目标:String = "大鸟部落"
@onready var label: Label = $Label


func _ready() -> void:
	label.text = 传送目标


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as Player:
		print("开始传送")
		for t in get_tree().get_nodes_in_group("传送目标"):
			if t.关卡名 == 传送目标:
				Global.play.global_position = t.global_position
		
		
