define ["app"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Memory = Backbone.Model.extend
            type: "Memory"
            memory: []
            address: 0
            x: 0
            y: 0
            width: 100
            height: 50
            addrLane: null
            dataLane: null
            readAddr: ->
                addr = this.get("addrLane")
                addr.read this, ->
                    this.set(address: addr.get("value"))
            unReadAddr: ->
                this.get("addrLane").unread(this)
            readData: ->
                data = this.get("dataLane")
                data.read this, ->
                    this.get("memory")[this.get("address")] = data.get("value")
            unReadData: ->
                this.get("dataLane").unread(this)
            writeData: ->
                data = this.get("dataLane")
                data.write this, =>
                    this.get("memory")[this.get("address")]
            unWriteData: ->
                this.get("dataLane").unWrite(this)