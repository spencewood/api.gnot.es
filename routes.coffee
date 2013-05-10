config = require './config'
Gnotes = require './controllers/gnote-controller'

module.exports = (server) ->
    ###
     Cross-origin for all calls
    ###
    server.all '/*', (req, res, next) ->
        referer = req.header 'Referer'
        if typeof referer is 'undefined' or config.allowedDomains.indexOf(referer) + '/' is -1
            res.send 403
            return

        if config.allowedDomains.indexOf(req.headers.origin) >= 0
            res.header 'Access-Control-Allow-Origin', req.headers.origin

        res.header 'Access-Control-Allow-Headers', 'X-Requested-With'
        next()

    ###
     Gnote
    ###
    server.post '/gnote', (req, res) ->
        new Gnotes().add req.body, (err, model) ->
            res.json id: model._id