define ["app", "simulate/item/item_view"], (mod86) ->
    mod86.module "Simulate.Item", (Item, mod86, Backbone, Marionette, $, _) ->
        Item.Controller =
            show: (id) ->
                mod86.mainRegion.show(new mod86.Simulate.Item.Processor())