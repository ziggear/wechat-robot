# phone.coffee

module.exports = (robot) ->
	robot.hear /^(加利大厦)$/i, (res) ->
		res.send '要去加利大厦，请回复“我要打车”，要找加利大厦地址，请回复“加利大厦地址”'

	robot.hear /^(加利大厦地址)$/i, (res) ->
		res.send '北京市朝阳区大屯街道北苑路180号，邮编是 100101'

	robot.hear /^(加利大厦物业|物业电话|物业)$/i, (res) ->
		res.send '加利大厦物业 64973975, 维修部 64973811, 马桶堵了打维修部电话'

	robot.hear /^寄快递$/i, (res) ->
		res.send '请回复“快递小哥”'

	robot.hear /^(快递小哥)$/i, (res) ->
		res.send '顺丰小哥：15801676322，圆通小哥：13370113055，都是加利大厦的配送员'

	robot.hear /^(没水了)$/i, (res) ->
		res.send '找人送水呀，请回复“送水电话”'

	robot.hear /^(送水|送水电话)$/i, (res) ->
		res.send '送水电话是 010-64890337'

	robot.hear /^(马桶|洗手池)([也]*)堵了$/i, (res) ->
		res.send '找物业啊，请回复“物业电话”'

	robot.hear /^男厕([所]*)堵了$/i, (res) ->
		res.send '找物业啊，请回复“物业电话”'

	robot.hear /^(我要打车|我要喝咖啡)$/i, (res) ->
		res.send '不如在致悦下个单吧'

	robot.hear /^wifi信号(差|弱)$/i, (res) ->
		res.send '要把2.4G和5G的信号都设置成相同ssid和密码，这样iPhone和mac会自动识别当前位置信号最好的那个频段，实际上也算是增加了覆盖率'