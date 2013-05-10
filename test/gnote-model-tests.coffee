Gnote = require '../models/gnote-model'
should = require 'should'
sinon = require 'sinon'
config = require '../config'

describe 'Gnote Model', ->
    it 'should be able to be saved with a message', (done) ->
        new Gnote(message: 'test').save (err, model) ->
            should.not.exist err
            should.exist model
            done()

    it 'should update createdAt property with date on save', (done) ->
        new Gnote().save (err, model) ->
            model.createdAt.should.be.instanceOf Date
            done()

    it 'should update updatedAt property with date on save', (done) ->
        new Gnote().save (err, model) ->
            model.updatedAt.should.be.instanceOf Date
            done()

    it 'should have the same updatedAt and createdAt date on initial save', (done) ->
        new Gnote().save (err, model) ->
            model.updatedAt.should.equal model.createdAt
            done()

    it 'should have a different updated date than created date when the model is updated', (done) ->
        new Gnote().save (err, model) ->
            model.save (err) ->
                model.updatedAt.should.not.equal model.createdAt
                done()