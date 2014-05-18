define ["app"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Lane = Backbone.Model.extend
            defaults:
                type: "Lane"
                classes: ["lane"]
                writeable: true
                value: 0
                path: []
                connectionProps: []
            read: (listener, fun) ->
                listener.listenTo(this, "change", fun)
                fun()
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
                this.stopListening(writer)
            update: (getter) -> =>
                this.set({ value: getter() })