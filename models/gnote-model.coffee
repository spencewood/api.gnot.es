mongoose = require 'mongoose'
timestamps = require 'mongoose-timestamp'
schema = require './schemas/gnote-schema'
config = require('../config').database
db = mongoose.createConnection config.url

schema.plugin timestamps

module.exports = db.model 'Gnote', schema