define ["app", "edit/list/list_view", "entities/processor"], (mod86) ->
    mod86.module "Edit.List", (List, mod86, Backbone, Marionette, $, _) ->
        List.Controller =
            show: ->
                descriptions = new mod86.Entities.ProcessorDescriptions()
                descriptions.fetch()
                mod86.mainRegion.show new List.Processors(collection: descriptions)
