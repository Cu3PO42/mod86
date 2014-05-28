define ["app"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.LaneReadOnlyAccess = Backbone.View.extend
            render: ->
            afterInitialize: ->
