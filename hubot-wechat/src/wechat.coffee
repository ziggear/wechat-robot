
Http        = require 'http'
Url         = require 'url'
Crypto      = require 'crypto'
Express     = require 'express'
bodyParser  = require 'body-parser'
XmlBuilder  = require 'xmlbuilder'
{parseString} = require 'xml2js'
wechat      = require 'wechat'

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

    message.extra_res.reply data
    message.sent = true

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
    user = new User 1001, name: 'Sample User'
    # message = new TextMessage user, 'test', 'MSG-001'
    # @robot.receive message

    @express = Express()
    # @express.use(bodyParser.urlencoded({ extended: false, type: 'text/xml' }))

    robot = @robot
    @express.use '/wechat', wechat('james_is_god', (req, res, next) ->
        # console.log req
        # content = req.weixin
        user = new User 1001, name: req.weixin['FromUserName']
        message = new TextMessage user, req.weixin['Content'], req.weixin['MsgId']
        message.extra_res = res
        message.sent = false
        robot.receive message

        timeout_ctrl = () ->
            console.log 'hello'
        setTimeout timeout_ctrl 3000

    )

    @express.listen @settings.port

exports.use = (robot) ->
  new Wechat robot
