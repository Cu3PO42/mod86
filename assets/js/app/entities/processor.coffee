define ["app", "all"], (mod86) ->
    mod86.module "Entities", (Entities, mod86, Backbone, Marionette, $, _) ->
        Entities.Processor = Backbone.Collection.extend
            initialize: (objects, options) ->
                lookup = {}
                for e, i in objects
                    objects[i] = Entities.Components[e.type](e)
                for e in objects
                    lookup[e.id] = e
                for e in objects
                    for prop in e.connectionsProps
                        e[prop] = lookup[e[prop]]
                Backbone.Collection::initialize.apply(this, objects, options)

