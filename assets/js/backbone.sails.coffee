require ["backbone", socket, sails], (Backbone, io) ->
    socket = io.connect()
