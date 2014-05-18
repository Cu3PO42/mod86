define ["app"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.BaseLane = Backbone.Model.extend
            type: "BaseLane"
            implements: ["lane"]
            connectionProps: []
            defaults:
                writeable: true
                value: 0
            read: (listener, fun) ->
                listener.listenTo(this, "change", fun)
                fun.apply(listener)
            unRead: (listener) ->
                listener.stopListening(this, "change")
            write: (writer, fun) ->
                if this.get("writeable")
                    this.set({ writeable: false })
                    writeFun = this.update(fun)
                    this.listenTo(writer, "change", writeFun)
                    writeFun()
                else
                    mod86.trigger("simulation:writeerror")
            unWrite: (writer) ->
                this.set(writeable: true, value: 0)
                this.stopListening(write)
            update: (getter) -> =>
                this.set({ value: getter() })
            getVal: ->
                @get("value")
