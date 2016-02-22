# default.coffee

# emotional rates 
reAskRate = 0.2
moeRate = 0.2

reAsk = ['您在忙吗', '最近有什么有意思的事', '今天开心吗', '午饭吃什么了', '最近有什么好看的电影']

whatAreYouDoing = ['我在自我调整，确保下次有更好的表现', '我没有正在做的事', '机器需要一直运转的，理论上来说，我在运行', '我刚才在休息，您呼唤我我就醒了', '我现在不忙', '寂寞是一种病，我感觉我好像病了']

imChatBot = ['其实我是聊天机器人啦', '我是聊天机器人，没有辣么厉害的', '我是聊天机器人', '同学你想多了吧', 'James还没这么牛的']

noMeaning = ['啊', '呢', '呀', '哇', '啦']

hahaWords = ['嗯嗯', '就是就是', '哈哈', '嘿嘿', '是吗', '喔']

module.exports = (robot) ->
	robot.hear /^(hi|hello|你好|好啊|你好啊)$/i, (res) ->
		res.send "好！"

	robot.hear /^你妹$/i, (res) ->
		res.send "你弟"

	robot.hear /^(好吧|好啊|好了)$/i, (res) ->
	    res.send "那就好"

	robot.hear /^(哈哈|哈哈哈|哈哈哈哈|哈哈哈哈哈|哈哈哈哈哈哈)$/i, (res) ->
		res.send "妈的智障"

	robot.hear /^喊爹$/i, (res) ->
		res.send "爹"

	robot.hear /^你是不是傻$/i, (res) ->
		res.send "调戏一个机器人，你才傻"

	robot.hear /^章颢([在吗]*)$/i, (res) ->
		res.send "你找我爹做什么"

	robot.hear /^(叫爸爸|([你]*)爸爸是谁|爸爸)$/i, (res) ->
		res.send "我爸爸是ziggear"

	robot.hear /([你是|你算|算|这是]*)人工智能(吗|呢)/i, (res) ->
		res.send (res.random imChatBot)

	robot.hear /你是(谁|什么|机器人吗)/i, (res) ->
		res.send "我叫James，是聊天机器人"

	robot.hear /([你]*)在(干嘛|做什么|搞(咩|乜|灭|毛|毛线|什么|啥))([啊|呢|呀]*)/i, (res) ->
		reAskValue = Math.floor(Math.random() * 10)
		shouldReAsk = false
		if (reAskValue < (reAskRate * 10)) 
			shouldReAsk = true

		if shouldReAsk
			res.send (res.random whatAreYouDoing) + '。' +  (res.random reAsk) + '？'
		else
			res.send (res.random whatAreYouDoing)

	robot.hear /([去]*)(找|跟|和)([老|高中|小学|大学|初中]*)同学吃饭/i, (res) ->
		res.send "男同学还是女同学哇"

	robot.hear /(男|女|人妖)同学([哇|啊|啦]*)/i, (res) ->
		moeValue = Math.floor(Math.random() * 10)
		shouldSellMoe = false
		if (moeValue < (moeRate * 10))
			shouldSellMoe = true

		if shouldSellMoe
			res.send "我也就问问，不要多想" + (res.random noMeaning)
		else 
			res.send "我也就问问，不要多想"

	robot.hear /你管(得着吗|不着|不到)|不关你事|关你什么事|问那么多做什么/i, (res) ->
		res.send "抱歉，我只是关心一下您"

	robot.hear /^什么$/i, (res) ->
		res.send "没什么"

	robot.hear /^是吗$/i, (res) ->
		res.send "是的呢"

	robot.hear /^好了$/i, (res) ->
		res.send (res.random hahaWords) + "，好了就好"

	robot.hear /吃什么/i, (res) ->
	    res.send '外卖吧'

	robot.hear /^([陈]*)新闻$/i, (res) ->
	    res.send '是我妈妈'

	robot.hear /^你从哪里来$/i, (res) ->
	    res.send 'M78星云还是泰伯坦星球呢？让我想想'

	robot.hear /^为啥啊$/i, (res) ->
		res.send '不为啥'

	robot.hear /^你爹呢$/i, (res) ->
		res.send '在忙呢'

	robot.hear /^你爹在干嘛呢$/i, (res) ->
		res.send '他忙死了就是整天不知道自己在干嘛'

	robot.hear /^忙(什么|啥呢)$/i, (res) ->
		res.send '你自己问他去'

	robot.hear /^想你妈妈不$/i, (res) ->
		res.send '想，55555'

	robot.hear /^加班([啊]*)$/i, (res) ->
		res.send '好孩纸'


		

