{EventEmitter} = require 'events'
User = require '../models/user-model'
validator = require 'email-validator'

class UserController extends EventEmitter
    constructor: ->

    sendLoginEmail: (address) ->
        return false unless validator.validate address
        @emit 'sendLoginEmail', address
        true

module.exports = new UserController()