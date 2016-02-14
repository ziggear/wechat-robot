
Http        = require 'http'
Url         = require 'url'
Crypto      = require 'crypto'
Express     = require 'express'
bodyParser  = require 'body-parser'
XmlBuilder  = require 'xmlbuilder'
{parseString} = require 'xml2js'

try
  {Robot,Adapter,TextMessage,User} = require 'hubot'
catch
  prequire = require('parent-require')
  {Robot,Adapter,TextMessage,User} = prequire 'hubot'

class Wechat extends Adapter
  validate: ->
        @settings =
            hostname: '127.0.0.1'
            port: 2000
            path: '/wechat'

  constructor: ->
    super
    @robot.logger.info "Constructor"

  send: (envelope, strings...) ->
    @robot.logger.info "Send"
    @robot.logger.info envelope
    data = ''
    data += str for str in strings

    user = envelope.user
    message = envelope.message

    xml = XmlBuilder.create 'xml'
    xml.ele 'ToUserName': {"#cdata" : user.name}
    xml.ele 'FromUserName': {"#cdata" : 'ziggear'}

    seconds = new Date().getTime() / 1000;
    xml.ele 'CreateTime', parseInt(seconds).toString()

    # Check if message contains image urls.
    pattern = /http(s?):\/\/.*?\.(png|jpg|jpeg|gif)/i
    match = data.match pattern
    if match
        url = "http://#{@settings.hostname}#{@settings.media_path}/#{encodeURIComponent match[0]}"
        xml.ele 'MsgType', 'news'
        xml.ele 'ArticleCount', '1'
        item = xml.ele('Articles').ele('item')
        item.ele 'PicUrl', url
        item.ele 'Url', url
        item.ele 'Title', ''
        item.ele 'Description', data
    else
        xml.ele 'MsgType': {"#cdata" : 'text' }
        xml.ele 'Content': {"#cdata" : data }

    xml.end { pretty: false }
    console.log xml.toString 'utf8'
    reply = '<xml><ToUserName><![CDATA[toUser]]></ToUserName><FromUserName><![CDATA[fromUser]]></FromUserName><CreateTime>12345678</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[你好]]></Contt></xml>'
    #message.extra.end xml.toString 'utf8'
    message.extra.set('Content-Type', 'text/xml')
    message.extra.end reply

  reply: (envelope, strings...) ->
    @robot.logger.info "Reply"
    strings = strings.map (s) -> "#{envelope.user.name}: #{s}"
    @send envelope, strings...

  receive_msg: (msg, user) ->
    @robot.logger.info "Received message " + msg + ", " + user

  run: ->
    @robot.logger.info "Run"
    @emit 'connected'
    @validate()

    # start up test
    # user = new User 1001, name: 'Sample User'
    # message = new TextMessage user, 'test', 'MSG-001'
    # @robot.receive message

    @express = Express()
    @express.use(bodyParser.urlencoded({ extended: false, type: 'text/xml' }))

    # validate by wechat
    @express.get @settings.path, (req, res) =>
        @robot.logger.info "Receive Get"

        parsed = Url.parse req.url, true
        signature = parsed['query']['signature']
        timestamp = parsed['query']['timestamp']
        nonce     = parsed['query']['nonce']
        echostr   = parsed['query']['echostr']
        token     = 'james_is_god'

        shasum = Crypto.createHash 'sha1'
        shasum.update [token, timestamp, nonce].sort().join('')
        expected = shasum.digest('hex')

        if signature is expected
            res.end echostr
        else
            res.end ''

    # receive wechat info
    @express.post @settings.path, (req, res) =>
        type = null
        from = null
        to = null
        timestamp = null
        text_content = ''
        req.setEncoding 'utf8'
        robot = @robot
        # parse raw xml from bodyParser
        xml_body = null
        # console.log req.body
        for key of req.body
            xml_body = key
        
        parseString xml_body, (err, result) ->
            # console.dir result
            from = result['xml']['FromUserName'].toString()
            text_content = result['xml']['Content']
            to = result['xml']['MsgId']
        # console.log from + ", " + content
        user = new User 1001, name: from
        message = new TextMessage(user, text_content.toString(), to.toString())
        message.extra = res
        @robot.receive message    

    @express.listen @settings.port

exports.use = (robot) ->
  new Wechat robot
