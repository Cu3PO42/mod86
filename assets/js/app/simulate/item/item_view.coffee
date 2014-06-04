define ["app", "snap", "keypress", "hbs!/templates/app/simulate/item", "hbs!/templates/app/lightbox", "simulate/item/pieces/all"], (mod86, Snap, keypress, itemTpl, lightboxTpl) ->
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
                newYMax = (val) ->
                    if val > ymax
                        ymax = val
                        @paper.attr
                            height: ymax
                @collection.each (item) ->
                    view = new mod86.Simulate.Item.Components[item.get("type")](model: item, paper: that.paper, keybindings: options.collection.keyboardBindings, groups: groups, newXMax: newXMax, newYMax: newYMax, root: that)
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
                tplArgs = bindings: (name: key for key, x of options.collection.keyboardBindings)
                $el = @$el = @el = $(itemTpl(tplArgs))
                for key, prop of options.collection.keyboardBindings
                    do ->
                        state = false
                        obj = collection.get(prop.obj)
                        obj.registerKeybinding(key, prop.on)
                        onFn = obj[prop.on].bind(obj)
                        offFn = obj[prop.off].bind(obj)
                        listEl = $el.find("#keybindinglist tr[data-binding='#{key}']")
                        keyEvents.push
                            keys: key
                            on_keydown: ->
                                unless that.inactive
                                    res = if state then offFn()
                                    else onFn()
                                    if res
                                        state = not state
                                        listEl.toggleClass("activated")
                @keyboardRegister = ->
                    @keyEvents = keyboardListener.register_many(keyEvents)
                @keyboardRegister()
                @keyboardUnregister = ->
                    keyboardListener.unregister_many(@keyEvents)
                @$el.find("#processorcontainer").append(@paper.node)
                @listenTo mod86, "simulation:error", (obj) ->
                    lightbox = lightboxTpl(contained: "<h3 style='color: red;'>Error!</h3>#{obj.msg}", buttontext: "OK")
                    @$el.append(lightbox)
                    @keyboardUnregister()

            onClose: ->
                @keyboardUnregister()

            render: ->
                @views.forEach (item) ->
                    item.render()

            closeLightbox: ->
                @$el.find("#lightboxcontainer").remove()
                @keyboardRegister()

            events:
                "click #lightbox .button": "closeLightbox"