require ["app", "list_view"], (mod86) ->
    mod86.module "Simulate.List", (List, mod86, Backbone, Marionette, $, _) ->
        List.Controller =
            show: ->
                mod86.mainRegion.show new List.List()