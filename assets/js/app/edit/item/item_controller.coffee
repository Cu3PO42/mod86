define ["app", "edit/item/item_view", "entities/processor"], (mod86) ->
    mod86.module "Edit.Item", (Item, mod86, Backbone, Marionette, $, _) ->
        Item.Controller =
            edit: (id) ->
                processor = new mod86.Entities.Processor({id: id}, {noSimulate: true})
                processor.fetch()
                mod86.mainRegion.show(new mod86.Edit.Item.Editor(model: processor))

            clone: (id) ->
                org = new mod86.Entities.Processor({id: id}, {noSimulate: true})
                org.fetch success: ->
                    obj = org.toJSON()
                    props = {}
                    props[prop] = obj[prop] for prop in ["name", "author", "description", "pieces", "keyboardBindings"]
                    clone = new mod86.Entities.Processor(props, {noSimulate: true})
                    mod86.mainRegion.show(new mod86.Edit.Item.Editor(model: clone))

            create: ->
                processor = new mod86.Entities.Processor({}, {noSimulate: true})
                mod86.mainRegion.show(new mod86.Edit.Item.Editor(model: processor))
