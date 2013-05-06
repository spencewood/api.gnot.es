Controller = require '../controllers/user-controller'
User = require '../models/user-model'
should = require 'should'
sinon = require 'sinon'
config = require '../config'

describe 'User Controller', ->
    it 'should be able to be instatiated', ->
        new Controller().should.be.instanceOf Object