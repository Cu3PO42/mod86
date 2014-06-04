define ["app"], (mod86) ->
    mod86.module "Edit.Item", (Item, mod86, Backbone, Marionette, $, _) ->
        Item.Editor = Backbone.View.extend
            initialize: ->
                @el = @$el = $("<div></div>")
            render: ->
