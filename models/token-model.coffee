mongoose = require 'mongoose'
schema = require './schemas/token-schema'
config = require('../config').database
db = mongoose.createConnection config.url

module.exports = db.model 'Token', schema