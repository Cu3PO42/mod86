define ["app", "entities/pieces/all"], (mod86) ->
    mod86.module "Entities", (Entities, mod86, Backbone, Marionette, $, _) ->
        Entities.Processor = Backbone.Collection.extend
            initialize: (models, options) ->
                update_piece = (collection, piece) ->
                    getNewProp = (desc) ->
                        if _.isNumber(desc)
                            collection.get(desc)
                        else
                            prop = collection.get(desc.id)
                            if desc.fun
                                prop[desc.fun](piece)
                            else if desc.prop
                                prop[desc.prop]
                            else
                                prop
                    update = {}
                    for prop in piece.connectionProps
                        tmp = piece.get(prop)
                        if _.isArray(tmp)
                            update[prop] = _.map(tmp, getNewProp)
                        else
                            update[prop] = getNewProp(tmp)
                    _.extend(piece, update)
                this.on "add", (piece) ->
                    update_piece(this, piece)
                , this
                this.on "reset", ->
                    that = this
                    this.each (piece) ->
                        update_piece(that, piece)
                , this
                options.silent = false

            model: (attrs, options) ->
                return new Entities.Components[attrs.type](attrs, options)
