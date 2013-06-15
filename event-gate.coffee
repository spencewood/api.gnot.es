config = require './config'
Gnotes = require './controllers/gnote-controller'
Users = require './controllers/user-controller'

pubnub = require('pubnub').init
    publish_key: config.pubnub.publish_key
    subscribe_key: config.pubnub.subscribe_key

# User events
Users.on 'sendLoginEmail', (emailAddress) ->
    pubnub.publish
        channel: 'login_email'
        message: emailAddress