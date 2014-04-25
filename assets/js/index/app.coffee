define ["backbone", "marionette", "marionette.handlebars"], (Backbone, Marionette) ->
    mod86 = new Backbone.Marionette.Application()
    mod86.addRegions
        mainRegion: "#main"
    mod86.on "initialize:before", ->
        require ["index/index"], ->
    mod86.on "initialize:after", ->
        require ["index/index"], ->
            mod86.mainRegion.show(new mod86.Index.Index())
    return mod86
