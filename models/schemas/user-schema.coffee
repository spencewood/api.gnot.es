mongoose = require 'mongoose'

module.exports = new mongoose.Schema
    email:
        type: String
        unique: true
        trim: true
        required: true
    token: String