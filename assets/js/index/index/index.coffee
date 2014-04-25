define ["app", "marionette", "hbs!/templates/index/index"], (mod86, Marionette, indexTpl) ->
    Index = mod86.module("Index")
    Index.Index = Marionette.ItemView.extend
        template:
            type: "handlebars"
            template: indexTpl
        serializeData: -> {}
    return Index
