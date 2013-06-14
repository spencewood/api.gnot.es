Gnote = require '../models/gnote-model'

class GnoteController
    constructor: ->

    add: (data, cb) ->
        gnote = new Gnote data
        gnote.save cb

module.exports = new GnoteController()