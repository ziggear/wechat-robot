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

	robot.hear /^(西瓜|桃子|苹果)$/i, (res) ->
		res.send "此功能为小葱拌面1.0的功能，现已下线"