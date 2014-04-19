require.config
    baseUrl: "/js"
    paths:
        "backbone": "vendor/backbone"
        "backbone.wreqr": "vendor/backbone.wreqr"
        "backbone.babysitter": "vendor/backbone.babysitter"
        "marionette": "vendor/backbone.marionette"
        "jquery": "vendor/jquery"
        "json2": "vendor/json2"
        "sails": "vendor/sails.io"
        "socket": "vendor/socket.io"
        "underscore": "vendor/underscore"

    shim:
        backbone:
            deps: ["jquery", "underscore", "json2"]
            exports: "Backbone"
        underscore:
            exports: "_"
        sails:
            deps: ["socket"]
        socket:
            exports: "io"

require ["backbone", "marionette"], (Backbone, Marionette) ->
    console.log("started up...")
