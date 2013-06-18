{EventEmitter} = require 'events'
User = require '../models/user-model'
LoginToken = require '../models/login-token-model'
validator = require 'email-validator'

class UserController extends EventEmitter
    constructor: ->

    sendLoginEmail: (email) ->
        return false unless validator.validate email

        new LoginToken(email: email).save (err, model) =>
            console.error err if err?
            @emit 'sendLoginEmail',
                email: email
                token: model.token

        true

module.exports = new UserController()