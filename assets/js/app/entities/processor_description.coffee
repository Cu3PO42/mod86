define ["app"], (mod86) ->
    mod86.module "Entities", (Entities, mod86, Backbone, Marionette, $, _) ->
        Entities.ProcessorDescription = Backbone.Model.extend
            defaults:
                author: "Generic Author"
                description: "A micro processor."
                name: "Genric Processor"

        Entities.ProcessorDescriptions = Backbone.Collection.extend
            model: Entities.ProcessorDescription
            url: "/api/processor/descriptions"
