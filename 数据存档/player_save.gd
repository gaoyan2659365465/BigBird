class_name PlayerSave extends Resource


"""
玩家存档

使用规范，这样数据一旦被更改，其他绑定此信号的地方就能被通知
signal set_hp
@export var hp = 100:
	set(value):
		hp = value
		set_hp.emit()
"""


# 玩家是否勾选协议
@export var privacy_agreement = false

# 红心碰到柱子减少
signal set_血量(v)
@export var 血量 = 3:
	set(value):
		if value >= 0:
			血量 = value
			set_血量.emit(value)


@export var 解锁关卡 = [1]


@export var 当前加载关卡 = 0


@export var 金币 = 0


signal set_通过柱子数(v)
@export var 通过柱子数 = 0:
	set(value):
		if value >= 0:
			通过柱子数 = value
			set_通过柱子数.emit(value)

# 进入关卡时会初始化该值 
@export var 最大柱子数 = 0

# 相当于局内背包，当关卡重新开始时清空
signal set_收集物品(v)
@export var 收集物品 = []:
	set(value):
		收集物品 = value
		set_收集物品.emit(value)
