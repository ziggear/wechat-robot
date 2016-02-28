# zhiyue.coffee

aboutJoymason = ['你的私人管家', '新型高品质生活提供商', 'AI-IM领域的先驱者', '据说有很多AI训练师哦', '类Magic？我觉得更像AMEX']

module.exports = (robot) ->
	robot.hear /^(致悦|Joymason|zhiyue|致悦科技)$/i, (res) ->
		res.send (res.random aboutJoymason)

	robot.hear /^(致悦App)$/i, (res) ->
		res.send '致悦App的下载地址是 https://appsto.re/cn/Z6Iv_.i'