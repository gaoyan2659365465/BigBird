extends Node


var save_file_path = "user://save/"
var save_file_name = "PlayerSave.tres"

var player_save:PlayerSave


# 相机
var camera

# 怪兽
var 怪兽

var 游戏场景

# 用于顶层的UI，比如金币收集效果
var umg:CanvasLayer = CanvasLayer.new()

var 声音 = AudioStreamPlayer.new()

# 专门用于读取表格数据
var excel_data:ExcelData = ExcelData.new()

var play

signal 通用触发框信号(事件名)


func _ready():
	self.add_child(umg)
	self.add_child(声音)
	self.add_child(excel_data)
	
	
	# 如果目录不存在则创建存档目录
	var dir = DirAccess.open("user://")
	if not dir.dir_exists(save_file_path):
		dir.make_dir(save_file_path)
		
	#判断存档文件是否存在
	if ResourceLoader.exists(save_file_path+save_file_name):
		player_save = ResourceLoader.load(save_file_path+save_file_name)
	else:
		player_save = PlayerSave.new()
		saveResource()

# 保存当前资源
func saveResource():
	ResourceSaver.save(player_save,save_file_path+save_file_name)


func 信息框(value:String):
	var xxk = preload("res://信息提示控件/message_panel.tscn").instantiate()
	xxk.text = value
	self.umg.add_child(xxk)
