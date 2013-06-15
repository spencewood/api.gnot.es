mongoose = require 'mongoose'

schema = new mongoose.Schema
    email:
        type: String
        unique: true
        trim: true
        required: true

module.exports = schema