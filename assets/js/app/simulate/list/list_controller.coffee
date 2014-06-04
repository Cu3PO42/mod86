define ["app", "simulate/list/list_view", "entities/processors"], (mod86) ->
    mod86.module "Simulate.List", (List, mod86, Backbone, Marionette, $, _) ->
        List.Controller =
            show: ->
                list = mod86.reqres.request("processors:list")
                mod86.mainRegion.show new List.Simulations(collection: new Backbone.Collection(list))
