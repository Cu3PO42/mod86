define ["app"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Memory = Backbone.Model.extend
            defaults:
                type: "Memory"
                memory: []
                address: 0
                x: 0
                y: 0
                width: 100
                height: 50
                addrLane: null
                dataLane: null
                connectionProps: ["addrLane", "dataLane"]
            readAddr: ->
                addr = this.addrLane
                addr.read this, =>
                    this.set(address: addr.get("value"))
            unReadAddr: ->
                this.addrLane.unRead(this)
            readData: ->
                data = this.dataLane
                data.read this, =>
                    this.get("memory")[this.get("address")] = data.get("value")
                    this.trigger("change")
            unReadData: ->
                this.dataLane.unread(this)
            writeData: ->
                data = this.dataLane
                data.write this, =>
                    this.get("memory")[this.get("address")]
            unWriteData: ->
                this.dataLane.unWrite(this)
            getMemory: ->
                this.get("memory")[this.get("address")] or 0