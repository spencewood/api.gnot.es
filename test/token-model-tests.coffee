LoginToken = require '../models/login-token-model'
should = require 'should'
sinon = require 'sinon'
config = require '../config'

describe 'Login Token Model', ->
    it 'should require an email address when creating a new token', ->
        new LoginToken().save (err, model) ->
            should.exist err

    it 'should generate a uuid when saving', (done) ->
        token = new LoginToken(email: 'test@test.com').save (err, model) ->
            model.token.should.not.be.null
            done()