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
                        }
                        {
                            type: "Memory"
                            address: 0
                            memory: [1,2,3,4,5,6]
                            id: 3
                            x: 200
                        }
                        {
                            type: "Bus"
                            id: 2
                        }
                        {
                            type: "Bus"
                            id: 4
                        }
                        {
                            type: "DeviceLane"
                            id: 5
                            device: 1
                            prop: "value"
                        }
                        {
                            type: "DeviceLane"
                            id: 6
                            device: 3
                            prop: "address"
                        }
                        {
                            type: "LaneAccess"
                            id: 7
                            device: 5
                            lane: 2
                        }
                        {
                            type: "LaneAccess"
                            id: 8
                            device: 6
                            lane: 2
                        }
                    ]
                    keyboardBindings:
                        "1":
                            obj: 7
                            on: "write"
                            off: "unWrite"
                        "2":
                            obj: 8
                            on: "read"
                            off: "unRead"
            }[id]