define ["app", "entities/pieces/baselane"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.DeviceLane = Components.BaseLane.extend
            type: "DeviceLane"
            connectionProps: ["device"]
            defaults:
                device: null
                prop: null
            overrideSet: (props, options) ->
                if props.value?
                    tmp = {}
                    tmp[@get("prop")] = props.value
                    @device.set(tmp)
                    delete props.value
                Components.BaseLane::set.apply(this, arguments)
            initialize: (models, options) ->
                @listenToOnce options.collection, "after:reset", ->
                    device = @device
                    prop = @get("prop")
                    @listenTo device, "change:#{prop}", ->
                        Components.BaseLane::set.call(this, {value: device.get(prop)})
                    @set(value: device.get(prop))
                    @set = @overrideSet

        _.defaults(Components.DeviceLane::defaults, Components.BaseLane::defaults)
        Components.DeviceLane::connectionProps = _.union(Components.DeviceLane::connectionProps, Components.BaseLane::connectionProps)
