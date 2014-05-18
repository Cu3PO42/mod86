define ["app"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Memory = Backbone.Model.extend
            connectionProps: []
            defaults:
                type: "Memory"
                memory: []
                address: 0
                value: 0
                x: 0
                y: 0
            initialize: ->
                @on "change:value", ->
                    @get("memory")[@get("address")] = @get("value")
                @on "change:address", ->
                    @set(value: @get("memory")[@get("address")])
                @trigger("change:address")