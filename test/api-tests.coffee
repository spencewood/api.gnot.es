require 'should'
sinon = require 'sinon'
should = require 'should'
request = require 'supertest'
express = require 'express'
server = express()
server.use express.bodyParser()
routes = require('../routes') server
config = require '../config'
Gnote = require '../models/gnote-model'

clearGnotes = (done) ->
    Gnote.collection.remove done

describe 'API', ->
    describe 'POST to /gnotes', ->
        beforeEach (done) ->
            clearGnotes done

        after (done) ->
            clearGnotes done

        it 'should respond with a 403 if a referer is not set', (done) ->
            request(server)
                .post('/gnotes')
                .expect 403, done

        it 'should return 200 when coming from a valid source', (done) ->
            request(server)
                .post('/gnotes')
                .set('Referer', config.allowedDomains[0])
                .expect 200, done

        it 'should return a gnote id on successful post', (done) ->
            request(server)
                .post('/gnotes')
                .set('Referer', config.allowedDomains[0])
                .end (err, res) ->
                    should.exist res.body.id
                    done()

        it 'should add a gnote when posting valid data', (done) ->
            request(server)
                .post('/gnotes')
                .set('Referer', config.allowedDomains[0])
                .end (err, res) ->
                    Gnote.count {}, (err, count) ->
                        count.should.equal 1
                        done()

    describe 'POST to /users/requestLogin', ->
        it 'should return 200 if posting a valid email address', (done) ->
            request(server)
                .post('/users/requestLogin')
                .set('Referer', config.allowedDomains[0])
                .send(emailAddress: 'test@test.com')
                .expect 200, done

        it 'should return 500 if posting an invalid email address', (done) ->
            request(server)
                .post('/users/requestLogin')
                .set('Referer', config.allowedDomains[0])
                .send(emailAddress: 'test.com')
                .expect 500, done

