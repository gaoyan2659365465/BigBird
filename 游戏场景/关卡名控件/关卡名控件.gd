extends Control


func 设置文字(text):
	$Panel/Label.text = text
	await get_tree().create_timer(2.0).timeout
	queue_free()
