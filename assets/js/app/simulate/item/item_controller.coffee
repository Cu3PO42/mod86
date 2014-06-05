define ["app", "simulate/item/item_view", "entities/processor"], (mod86) ->
    mod86.module "Simulate.Item", (Item, mod86, Backbone, Marionette, $, _) ->
        Item.Controller =
            show: (id) ->
                processor = new mod86.Entities.Processor(id: id)
                processor.fetch()
                mod86.mainRegion.show(new mod86.Simulate.Item.Processor(processor: processor))