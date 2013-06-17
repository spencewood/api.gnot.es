Controller = require '../controllers/user-controller'
User = require '../models/user-model'
should = require 'should'
sinon = require 'sinon'
config = require '../config'

describe 'User Controller', ->
    describe 'requestLogin', ->
        it 'should emit an email event with email and token when called', (done) ->
            emailAddress = 'test@test.com'

            Controller.once 'sendLoginEmail', (message) ->
                message.email.should.equal emailAddress
                message.token.should.not.be.null
                done()

            Controller.sendLoginEmail emailAddress