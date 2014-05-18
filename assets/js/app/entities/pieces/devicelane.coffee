define ["app", "entities/pieces/baselane"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.DeviceLane = Components.BaseLane.extend
            connectionProps: ["device"]
            defaults:
                device: null
                prop: null
            connectionProps: ["device"]
            get: (prop) ->
                if prop == "value"
                    @device.get("value")
                else
                    Components.BaseLane::get.apply(this, arguments)
            set: (props, options) ->
                if props.value?
                    tmp = {}
                    tmp[@get("prop")] = props.value
                    @device.set(tmp)
                    delete props.value
                Components.BaseLane::set.apply(this, arguments)
            initialize: ->
                device = @device
                prop = @get("prop")
                @on "after:reset", ->
                    @listenTo device, "change:#{prop}", ->
                        @set(value: device[prop])
