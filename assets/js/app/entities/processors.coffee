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
                1: [
                    {
                        type: "Memory"
                    }
                ]
            }[id]