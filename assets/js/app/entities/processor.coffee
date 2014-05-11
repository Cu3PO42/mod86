define ["app", "entities/pieces/all"], (mod86) ->
    mod86.module "Entities", (Entities, mod86, Backbone, Marionette, $, _) ->
        Entities.Processor = Backbone.Collection.extend
            initialize: (options) ->
                update_piece = (collection, piece) ->
                    update = {}
                    for prop in piece.get("connectionProps")
                        update[prop] = collection.get(piece.get(prop))
                    piece.set(update)
                this.on "add", (piece) ->
                    update_piece(this, piece)
                , this
                this.on "reset", ->
                    that = this
                    this.each (piece) ->
                        update_piece(that, piece)
                , this

            model: (attrs, options) ->
                return new Entities.Components[attrs.type](attrs, options)
