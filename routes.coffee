passport = require 'passport'
BearerStrategy = require('passport-http-bearer').Strategy
config = require './config'
Gnotes = require './controllers/gnote-controller'
Users = require './controllers/user-controller'

passport.use new BearerStrategy (token, done) ->
    Users.validate token: token, (isSuccess) ->
        if isSuccess
            return done err
        #unless 

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
     Gnotes
    ###
    server.post '/gnotes', (req, res) ->
        Gnotes.add req.body, (err, model) ->
            res.json id: model._id

    ###
     Users
    ###
    server.post '/users/requestLogin', (req, res) ->
        if Users.sendLoginEmail req.body.emailAddress then res.send 200 else res.send 500

    server.get '/users/login', (req, res) ->
        Users.login req.login_token, (err, model) ->
            res.json id: model._id