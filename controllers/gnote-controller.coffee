Gnote = require '../models/gnote-model'

module.exports = class GnoteController
    constructor: ->

    add: (data, cb) ->
        gnote = new Gnote data
        gnote.save cb