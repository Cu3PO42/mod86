define ["sails"], (io) ->
    socket = io.connect()
    return socket