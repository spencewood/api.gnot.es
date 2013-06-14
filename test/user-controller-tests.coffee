Controller = require '../controllers/user-controller'
User = require '../models/user-model'
should = require 'should'
sinon = require 'sinon'
config = require '../config'

describe 'User Controller', ->
    describe 'sendLoginEmail', ->
        it 'should emit an email event with address when called', (done) ->
            emailAddress = 'test@test.com'

            Controller.once 'sendLoginEmail', (address) ->
                address.should.equal emailAddress
                done()

            Controller.sendLoginEmail emailAddress