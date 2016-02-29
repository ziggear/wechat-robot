#sms.coffee

module.exports = (robot) ->
	robot.hear /^给([0-9]*)发短信，内容是：(.*)$/i, (res) ->
		num = res.match[1]
		content = res.match[2]
		res.send "好的，这就给#{num}发内容是#{content}的短信"

		a_content = '【致悦管家】尊敬的' + num + '，日程提醒服务温馨提示您现在，'+ content +'，请妥善安排您的时间。'
		apikey = '8097fb18443c8c6aac5d17b0d8d79e7d'
		data = {
			'apikey': apikey,
			'mobile': num,
			'text': a_content
		}

		robot.http("https://sms.yunpian.com/v1/sms/send.json")
    		.header('Content-Type', 'application/json')
    		.post(data) (err, res, body) ->
      			console.log(res)