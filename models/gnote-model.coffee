mongoose = require 'mongoose'
schema = require './schemas/gnote-schema'
config = require('../config').database
db = mongoose.createConnection config.url

module.exports = db.model 'gnote', schema