express = require 'express'
mongoose = require 'mongoose'
config = require './config'

require './event-gate'

server = express()
server.use express.bodyParser()
routes = require('./routes') server

server.listen config.port, ->
    console.log "Listening on #{config.port}"