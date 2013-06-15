mongoose = require 'mongoose'
timestamps = require 'mongoose-timestamp'

schema = new mongoose.Schema
    content:
        type: String

schema.plugin timestamps

module.exports = schema