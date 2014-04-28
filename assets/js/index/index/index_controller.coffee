define ["app", "static_view", "socket.sails", "hbs!/templates/index/index", "hbs!/templates/index/pricing", "hbs!/templates/index/faq",
        "hbs!/templates/index/contact", "hbs!/templates/index/impress", "hbs!/templates/index/login", "hbs!/templates/index/signup"],
(mod86, StaticView, socket, indexTpl, pricingTpl, faqTpl, contactTpl, impressTpl, loginTpl, signupTpl) ->
    mod86.module "Index", (Index, mod86, Backbone, Marionette, $, _) ->
        Index.Controller =
            showIndex: ->
                mod86.mainRegion.show new mod86.StaticView
                    template:
                        type: "handlebars"
                        template: indexTpl
                    className: "index"
            showPricing: ->
                mod86.mainRegion.show new mod86.StaticView
                    template:
                        type: "handlebars"
                        template: pricingTpl
                    className: "pricing"
            showFAQ: ->
                mod86.mainRegion.show new mod86.StaticView
                    template:
                        type: "handlebars"
                        template: faqTpl
                    className: "faq"
            showContact: ->
                mod86.mainRegion.show new mod86.StaticView
                    template:
                        type: "handlebars"
                        template: contactTpl
                    className: "contact"
            showImpress: ->
                mod86.mainRegion.show new mod86.StaticView
                    template:
                        type: "handlebars"
                        template: impressTpl
                    className: "impress"
            showLogin: ->
                mod86.mainRegion.show new mod86.StaticView
                    template:
                        type: "handlebars"
                        template: loginTpl
                    className: "login"
            showSignup: ->
                mod86.mainRegion.show new mod86.StaticView
                    template:
                        type: "handlebars"
                        template: signupTpl
                    className: "signup"

            login: (username, password) ->
                socket.post "/login", {username: username, password: password}, (data) ->
                    window.location.href = "http://localhost:1337" if data.login && data.successfull
