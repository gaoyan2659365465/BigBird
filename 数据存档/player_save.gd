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

@export var 最大血量 = 3


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

# 每一个引导项都有专门的数字，只需要监控这个数字就能知道何时触发引导
signal set_引导流程(v)
@export var 引导流程 = 0:
	set(value):
		引导流程 = value
		set_引导流程.emit(value)


@export var 禁用玩家操作 = false


signal 领取成就奖励
@export var 统计已达成成就 = []
@export var 统计成就领取奖励 = []

signal set_统计死亡次数(v)
@export var 统计死亡次数 = 0:
	set(v):
		统计死亡次数 = v
		set_统计死亡次数.emit(v)

signal set_统计红心收集(v)
@export var 统计红心收集 = 0:
	set(v):
		统计红心收集 = v
		set_统计红心收集.emit(v)

signal set_统计红心消耗(v)
@export var 统计红心消耗 = 0:
	set(v):
		统计红心消耗 = v
		set_统计红心消耗.emit(v)

signal set_统计金币总数(v)
@export var 统计金币总数 = 0:
	set(v):
		统计金币总数 = v
		set_统计金币总数.emit(v)

signal set_统计穿过管道次数(v)
@export var 统计穿过管道次数 = 0:
	set(v):
		统计穿过管道次数 = v
		set_统计穿过管道次数.emit(v)

signal set_统计跳跃次数(v)
@export var 统计跳跃次数 = 0:
	set(v):
		统计跳跃次数 = v
		set_统计跳跃次数.emit(v)

signal set_统计最高通关(v)
@export var 统计最高通关 = 0:
	set(v):
		统计最高通关 = v
		set_统计最高通关.emit(v)
