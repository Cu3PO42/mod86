define ["app", "snap", "keypress", "hbs!/templates/app/simulate/item", "simulate/item/pieces/all"], (mod86, Snap, keypress, itemTpl) ->
    mod86.module "Simulate.Item", (Item, mod86, Backbone, Marionette, $, _) ->
        Item.Processor = Backbone.View.extend
            initialize: (options) ->
                collection = @collection = new mod86.Entities.Processor(options.collection.pieces, {})
                @paper = new Snap()
                groups =
                    lanes: @paper.g()
                @views = []
                that = this
                xmax = 0
                ymax = 0
                newXMax = (val) ->
                    if val > xmax
                        xmax = val
                        @paper.attr
                            width: xmax
                        console.log "new xMax #{xmax}"
                newYMax = (val) ->
                    if val > ymax
                        ymax = val
                        @paper.attr
                            height: ymax
                        console.log "new yMax #{ymax}"
                @collection.each (item) ->
                    view = new mod86.Simulate.Item.Components[item.get("type")](model: item, paper: that.paper, keybindings: options.collection.keyboardBindings, groups: groups, newXMax: newXMax, newYMax: newYMax)
                    that.views.push(view)
                _.each @views, (view) =>
                    for prop in ["x", "y"]
                        coord = view.model.get(prop)
                        if coord? and coord.obj?
                            tmp = {}
                            res = @collection.get(coord.obj).getPoint(coord.prop)[prop]
                            if coord.offset?
                                res += coord.offset
                            tmp[prop] = res
                            view.model.set(tmp)
                    view.afterInitialize()
                keyboardListener = new keypress.Listener()
                keyEvents = []
                tplArgs = bindings: (name: key for key, _ of options.collection.keyboardBindings)
                $el = @$el = @el = $(itemTpl(tplArgs))
                for key, prop of options.collection.keyboardBindings
                    do ->
                        state = false
                        obj = collection.get(prop.obj)
                        onFn = obj[prop.on].bind(obj)
                        offFn = obj[prop.off].bind(obj)
                        listEl = $el.find("#keybindinglist tr[data-binding='#{key}']")
                        keyEvents.push
                            keys: key
                            on_keydown: ->
                                res = if state then offFn()
                                else onFn()
                                if res
                                    state = not state
                                    listEl.toggleClass("activated")
                keyEvents = keyboardListener.register_many(keyEvents)
                @keyboardUnregister = ->
                    keyboardListener.unregister_many(keyEvents)
                @$el.find("#processorcontainer").append(@paper.node)

            onClose: ->
                @keyboardUnregister()

            render: ->
                @views.forEach (item) ->
                    item.render()
