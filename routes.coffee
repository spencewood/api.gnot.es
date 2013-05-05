config = require './config'

routes = (server) ->
    ###
     Cross-origin for all calls
    ###
    server.all '/*', (req, res, next) ->
        if config.allowedDomains.indexOf(req.headers.origin) >= 0
            res.header 'Access-Control-Allow-Origin', req.headers.origin

        res.header 'Access-Control-Allow-Headers', 'X-Requested-With'
        next()

module.exports = routes