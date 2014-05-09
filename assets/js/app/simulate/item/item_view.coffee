define ["app", "raphael", "backbone.raphael"], (mod86, Raphael) ->
    mod86.module "Simulate.Item", (Item, mod86, Backbone, Marionette, $, _) ->
        Item.Processor = Backbone.View.extend
            initialize: (options) ->
                canvas = $("<canvas></canvas>")
                this.paper = new Raphael(canvas, options.height, options.width)
                this.$el = this.el = canvas
                this.buffered = true
                this.container = options.container

            render: ->
                this.container.appendChild(this.el) if this.buffered
                this.buffered = false
                this