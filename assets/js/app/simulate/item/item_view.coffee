define ["app", "snap", "keypress", "simulate/item/pieces/all"], (mod86, Snap, keypress) ->
    mod86.module "Simulate.Item", (Item, mod86, Backbone, Marionette, $, _) ->
        Item.Processor = Backbone.View.extend
            initialize: (options) ->
                collection = @collection = new mod86.Entities.Processor(options.collection.pieces, {})
                @paper = new Snap(options.height, options.width)
                @$el = $(@el = @paper.node)
                @views = []
                that = this
                @collection.forEach (item) ->
                    view = new mod86.Simulate.Item.Components[item.get("type")](model: item, paper: that.paper, keybindings: options.collection.keyboardBindings)
                    that.views.push(view)
                keyboardListener = new keypress.Listener()
                keyEvents = []
                for key, prop of options.collection.keyboardBindings
                    do ->
                        state = false
                        obj = collection.get(prop.obj)
                        onFn = obj[prop.on].bind(obj)
                        offFn = obj[prop.off].bind(obj)
                        keyEvents.push
                            keys: key
                            on_keydown: ->
                                if state then offFn()
                                else onFn()
                                state = not state
                keyEvents = keyboardListener.register_many(keyEvents)
                @keyboardUnregister = ->
                    keyboardListener.unregister_many(keyEvents)


            onClose: ->
                @keyboardUnregister()

            render: ->
                @views.forEach (item) ->
                    item.render()
