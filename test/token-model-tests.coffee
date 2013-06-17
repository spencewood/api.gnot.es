Token = require '../models/token-model'
should = require 'should'
sinon = require 'sinon'
config = require '../config'

describe 'Token Model', ->
    it 'should require an email address when creating a new token', ->
        new Token().save (err, model) ->
            should.exist err

    it 'should generate a uuid when saving', (done) ->
        token = new Token(email: 'test@test.com').save (err, model) ->
            model.token.should.not.be.null
            done()