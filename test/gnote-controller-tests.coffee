Controller = require '../controllers/gnote-controller'
User = require '../models/gnote-model'
should = require 'should'
sinon = require 'sinon'
config = require '../config'

describe 'Gnote Controller', ->
    it 'should be able to be instatiated', ->
        new Controller().should.be.instanceOf Object

    describe 'add', ->
        it 'should add a new record', (done) ->
            new Controller().add {}, (err, model) ->
                should.not.exist err
                should.exist model
                done()