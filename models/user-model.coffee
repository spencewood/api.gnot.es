mongoose = require 'mongoose'
schema = require './schemas/user-schema'
config = require('../config').database
db = mongoose.createConnection config.url

module.exports = db.model 'User', schema