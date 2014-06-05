define ["app", "simulate/list/list_view", "entities/processor_description"], (mod86) ->
    mod86.module "Simulate.List", (List, mod86, Backbone, Marionette, $, _) ->
        List.Controller =
            show: ->
                descriptions = new mod86.Entities.ProcessorDescriptions()
                descriptions.fetch()
                mod86.mainRegion.show new List.Simulations(collection: descriptions)
