mongoose = require 'mongoose'
uuid = require 'node-uuid'

schema = new mongoose.Schema
    token:
        type: String
        unique: true
    issued:
        type: Date
        default: Date.now
    expires:
        type: Date

schema.pre 'save', (next) ->
    @token = uuid.v4()
    next()

module.exports = schema