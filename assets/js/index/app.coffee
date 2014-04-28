define ["backbone", "marionette", "marionette.handlebars"], (Backbone, Marionette) ->
	mod86 = new Backbone.Marionette.Application()
	mod86.addRegions
		mainRegion: "#mainWrapper"
	mod86.Router = Marionette.AppRouter.extend
		appRoutes:
            "": "showIndex"
            "pricing": "showPricing"
            "faq": "showFAQ"
            "contact": "showContact"
            "impress": "showImpress"
            "login": "showLogin"
            "signup": "showSignup"
    mod86.on "initialize:after", ->
        require ["index/index_controller"], ->
            new mod86.Router
                controller: mod86.Index.Controller
            Backbone.history.start pushState: true
            $(document).on "click", "a:not([data-bypass])", (e) ->
                e.preventDefault()
                Backbone.history.navigate($(this).attr("href"), true)
	return mod86
