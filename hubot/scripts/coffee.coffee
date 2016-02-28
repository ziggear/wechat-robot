# coffee.coffee

coffeeHello = [
	'我有收录咖啡知识哦，不怕你考我',
	'我对咖啡还算了解，因为我爹喜欢',
	'我还不能点咖啡，但是可以向你介绍一写咖啡的知识'
]

coffeeShops = [
	'星巴克做得很专业，就是烘焙过重了有的人喝了会心悸', 
	'Costa一般般吧味道有点淡', '雕刻时光只能算一般，但是他们的咖啡培训做得不错',
	'漫咖啡就是去装逼的地方嘛，咖啡和食物可以直接倒掉了', 
	'3W咖啡和车库咖啡，你以为是咖啡馆，其实是互联网公司呢', '好像没人提麦当劳，他们早餐的美式咖啡每次能做到一般的难喝也是挺稳定的', 
	'太平洋咖啡真的有人去吗', 
	'咖啡陪你就是漫咖啡的翻版呢，韩国人开的咖啡馆能怎样',
	'那个叫猫屎咖啡的门店真卖的是真的麝香猫咖啡吗？我表示怀疑'
]

coffeeBeans = [
	'关于咖啡豆我只知道有阿拉比卡和罗布斯塔两种，那些亚种什么的就没有研究了呢',
	'好的咖啡豆都产在热带高海拔地区吧？不服来辩',
	'说道咖啡豆，就必须提一下咖啡带吧'
]

starBucks = [
	'是最好的连锁咖啡店了吧，没有之一',
	'全世界哪一家星巴克的品质都很稳定，给人一种安全感',
	'星巴克的咖啡“喝起来像那么回事”，是因为烘焙都偏重啊'
]

latte = [
	'有人说拿铁不算咖啡，因为奶太多啦——反正我是不同意',
	'拿铁实际上是不甜的，因为标准的拿铁不带糖',
	'往浓缩咖啡里面冲入打好的奶泡，就是拿铁啊'
]

module.exports = (robot) ->
	robot.hear /^咖啡$/i, (res) ->
		res.send '是想让我给你订咖啡？那回复“我要喝咖啡”就行。回复“咖啡介绍”，偷偷告诉你一些咖啡知识'

	robot.hear /^咖啡介绍$/i, (res) ->
	    res.send (res.random coffeeHello)

	robot.hear /^星巴克$/i, (res) ->
		res.send (res.random starBucks)

	robot.hear /^阿拉比卡$/i, (res) ->
		res.send '一种咖啡豆啊'

	robot.hear /什么咖啡好喝|咖啡馆|都有哪些咖啡馆呢|咖啡店/i, (res) ->
		res.send (res.random coffeeShops)

	robot.hear /咖啡豆|什么咖啡豆比较好/i, (res) ->
		res.send (res.random coffeeBeans)

	robot.hear /^(拿铁|拿铁咖啡)$/i, (res) ->
		res.send (res.random latte)

	robot.hear /^(Flat white|馥芮白)$/i, (res) ->
		res.send 'Flat White 和拿铁很像的，但是James觉得真的没拿铁好喝啦'

	robot.hear /^摩卡$/i, (res) ->
		res.send '你想知道摩卡咖啡、摩卡壶还是摩卡豆呢？'

