###
 Global Configuration
###

module.exports =
    port: process.env.PORT or 5000
    database:
        url: process.env.MONGOLAB_URI or
            process.env.MONGOHQ_URL or
            'mongodb://localhost/Gnotes'

    ###
     Cross-origin allowed domains
    ###
    allowedDomains: [
        'http://localhost:4000',
        'http://gnot.es',
        'http://www.gnot.es'
    ]