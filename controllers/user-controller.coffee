{EventEmitter} = require 'events'
User = require '../models/user-model'
LoginToken = require '../models/login-token-model'
validator = require 'email-validator'

class UserController extends EventEmitter
    constructor: ->

    sendLoginEmail: (email) ->
        return false unless validator.validate email

        new LoginToken(email: email).save (err, model) =>
            if err?
                console.error err
                return
            @emit 'sendLoginEmail',
                email: email
                token: model.token

        true

    login: (token) ->
        

module.exports = new UserController()