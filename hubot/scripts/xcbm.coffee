# xcbm.coffee

xcbmDesc = [
	'伟大的微信公众号',
	'听说要融资500万，已经完成三分之一：0万 了',
	'一直不更新，老章太懒了是吧',
	'听说小于哥要接盘呢，也不知道要出多少钱收购'
]

module.exports = (robot) ->
	robot.hear /^小葱拌面([是啥]*)$/i, (res) ->
		res.send (res.random xcbmDesc)

	robot.hear /^(西瓜|桃子|苹果|白菜|猪|肉|猪肉)$/i, (res) ->
		res.send "此功能为小葱拌面1.0的功能，现已下线"

	robot.hear /^(小于哥|大牙|老肖)$/i, (res) ->
		res.send "哈哈哈逗逼哈哈"

	robot.hear /^你是煤球么$/i, (res) ->
		res.send "我是James，哼"

	robot.hear /^(暖雪|煤球)$/i, (res) ->
		res.send "她走了，去了一个温暖的地方"

	robot.hear /^终于更新了$/i, (res) ->
		res.send "好了好了我知道了，我会告诉我爹的"

	robot.hear /^一清二白$/i, (res) ->
		res.send "——就是小葱拌面"

	robot.hear /^致亲爱的读者$/i, (res) ->
		res.send "最近你有没有很想我？"