#weather.coffee

module.exports = (robot) ->
	robot.hear /^(.*)天气$/i, (res) ->
		doorType = res.match[1]
		res.send "就不告诉你#{doorType}的天气"