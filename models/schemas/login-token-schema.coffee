mongoose = require 'mongoose'
uuid = require 'node-uuid'

schema = new mongoose.Schema
    token:
        type: String
        unique: true
    email:
        type: String
        trim: true
        required: true
    issued:
        type: Date
        default: Date.now
    isUsed: Boolean

schema.pre 'save', (next) ->
    @token = uuid.v4()
    next()

module.exports = schema