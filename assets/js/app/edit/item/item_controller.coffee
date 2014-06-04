define ["app", "edit/item/item_view", "entities/processor"], (mod86) ->
    mod86.module "Edit.Item", (Item, mod86, Backbone, Marionette, $, _) ->
        Item.Controller =
            show: (id) ->
                processor = mod86.reqres.request("processors:item", id)
                mod86.mainRegion.show(new mod86.Edit.Item.Editor(new Backbone.Model(test: "10", content: processor)))
