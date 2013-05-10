require 'should'
sinon = require 'sinon'
request = require 'supertest'
express = require 'express'
server = express()
server.use express.bodyParser()
routes = require('../routes') server
config = require('../config')
Gnote = require '../models/gnote-model'

clearGnotes = (done) ->
    Gnote.collection.remove done

describe 'API', ->
    describe 'POST to /gnote', ->
        beforeEach (done) ->
            clearGnotes done

        after (done) ->
            clearGnotes done

        it 'should respond with a 403 if an a referer is not set', (done) ->
            request(server)
                .post('/gnote')
                .expect 403, done

        it 'should return 200 when coming from a valid source', (done) ->
            request(server)
                .post('/gnote')
                .set('Referer', config.allowedDomains[0])
                .expect(200, done);