require.config
    baseUrl: "/js/index"
    paths:
        "backbone": "../vendor/backbone"
        "backbone.wreqr": "../vendor/backbone.wreqr"
        "backbone.babysitter": "../vendor/backbone.babysitter"
        "marionette": "../vendor/backbone.marionette"
        "marionette.handlebars": "../vendor/backbone.marionette.handlebars"
        "jquery": "../vendor/jquery"
        "json2": "../vendor/json2"
        "sails": "../vendor/sails.io"
        "socket": "../vendor/socket.io"
        "underscore": "../vendor/underscore"
        "hbs": "../vendor/hbs"
        "handlebars": "../vendor/handlebars"
        "handlebars.runtime": "../vendor/handlebars.runtime"
        "i18nprecompile": "../vendor/i18nprecompile"

    shim:
        underscore:
            exports: "_"
        sails:
            deps: ["socket"]
        socket:
            exports: "io"
        json2:
            exports: "JSON"

    map:
        "*":
            "hbs/handlebars": "handlebars"
            "hbs/handlebars.runtime": "handlebars.runtime"
            "hbs/underscore": "underscore"
            "hbs/jquery": "jquery"
            "hbs/json2": "json2"
            "hbs/i18nprecompile": "i18nprecompile"

require ["app"], (mod86) ->
    mod86.start()
