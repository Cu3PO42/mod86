define ["app"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Lane = Backbone.Model.extend
            type: "Lane"
            classes: ["lane"]
            writeable: true
            value: null
            path: []
            read: (listener, fun) ->
                listener.listenTo(this, "change", fun)
            unRead: (listener) ->
                listener.stopListening(this, "change")
            write: (writer, fun) ->
                if this.get("writeable")
                    this.set({ writeable: false })
                    this.listenTo(writer, "change", this.update(fun))
                else
                    mod86.trigger("simulation:writeerror")
            unWrite: (writer) ->
                this.set({ writeable: true })
                this.stopListening(writer, this.update)
            unread: (listener) ->
            update: (getter) -> ->
                this.set({ value: getter() })