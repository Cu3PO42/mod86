define ["app"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.BaseIC = Backbone.Model.extend
            defaults:
                x: 0
                y: 0
