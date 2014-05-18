define ["app"], (mod86) ->
    mod86.module "Entities", (Entities, mod86, Backbone, Marionette, $, _) ->
        mod86.reqres.setHandler "processors:list", -> [
            {
                name: "Bonsai"
                id: 1
                description: "Der Bonsai Lerncomputer"
                author: "Klaus Merkert"
            }
        ]

        mod86.reqres.setHandler "processors:item", (id) ->
            {
                1:
                    name: "Bonsai"
                    id: 1
                    description: "Der Bonsai Lerncomputer"
                    author: "Klaus Merkert"
                    pieces: [
                        {
                            type: "Memory"
                            address: 1
                            memory: [12, 3]
                            id: 1
                            addrLane: 4
                            dataLane: 2
                        }
                        {
                            type: "Lane"
                            id: 2
                        }
                        {
                            type: "Memory"
                            address: 0
                            memory: [1,2,3,4,5,6]
                            id: 3
                            addrLane: 2
                            dataLane: 4
                            x: 200
                        }
                        {
                            type: "Lane"
                            id: 4
                        }
                    ]
                    keyboardBindings:
                        "1":
                            obj: 1
                            on: "writeData"
                            off: "unWriteData"
                        "2":
                            obj: 3
                            on: "readAddr"
                            off: "unReadAddr"
            }[id]