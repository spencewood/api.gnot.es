Controller = require '../controllers/gnote-controller'
User = require '../models/gnote-model'
should = require 'should'
sinon = require 'sinon'
config = require '../config'

describe 'Gnote Controller', ->
    describe 'add', ->
        it 'should add a new record', (done) ->
            Controller.add {}, (err, model) ->
                should.not.exist err
                should.exist model
                done()