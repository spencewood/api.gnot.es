Token = require '../models/token-model'
should = require 'should'
sinon = require 'sinon'
config = require '../config'

describe 'Token Model', ->
    it 'should generate a uuid when saving', (done) ->
        token = new Token().save (err, model) ->
            model.token.should.not.be.null
            done()