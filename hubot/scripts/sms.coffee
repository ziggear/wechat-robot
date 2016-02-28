#sms.coffee

module.exports = (robot) ->
	robot.hear /^给([0-9]*)发短信，内容是：(.*)$/i, (res) ->
		num = res.match[1]
		content = res.match[2]
		res.send "好的，这就给#{num}发内容是#{content}的短信"