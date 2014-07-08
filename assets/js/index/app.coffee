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
                $("header#header nav a").each ->
                    $(this).removeClass("active")
                    $(this).addClass("active") if $(this).attr("href").substring(1) == Backbone.history.fragment
    $("header#header nav a").each ->
        $(this).removeClass("active")
        $(this).addClass("active") if $(this).attr("href").substring(1) == Backbone.history.fragment
    $(document).on "click", "form[name='login'] input[type='submit']", (e) ->
        e.preventDefault()
        require ["index/index_controller"], ->
            login = document.forms["login"]
            mod86.Index.Controller.login(login.username.value, login.password.value)
        return false
    $(document).on "click", "form[name='signup'] input[type='submit']", (e) ->
        e.preventDefault()
        require ["index/index_controller"], ->
            signup = document.forms["signup"]
            mod86.Index.Controller.signup(signup.username.value, signup.email.value, signup.password.value, signup.passcode.value)
    mod86.on "login:success", ->
        window.location.href = "#{window.location.protocol}//#{window.location.hostname}"
    mod86.on "login:failed", ->
        alert("Login failed!")
    mod86.on "signup:success", (username, password) ->
        require ["index/index_controller"], ->
            mod86.Index.Controller.login(username, password)
    mod86.on "signup:failed", ->
        alert("Signup failed. eMail address and username must be unique.")
    return mod86
