define ["backbone", "marionette", "marionette.handlebars"], (Backbone, Marionette) ->
    mod86 = new Backbone.Marionette.Application()
    mod86.addRegions
        mainRegion: "#mainWrapper"
    return mod86
