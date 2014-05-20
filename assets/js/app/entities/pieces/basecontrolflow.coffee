define ["app"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.BaseControlFlow = Backbone.Model.extend
            type: "BaseControlFlow"
            connectionProps: []
            implements: []
            defaults:
                x: 0
                y: 0
