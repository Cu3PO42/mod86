var passport      = require('passport'),
    LocalStrategy = require('passport-local').Strategy,
    bcrypt        = require('bcryptjs');

module.exports = {
    express: {
        customMiddleware: function(app){
            app.use(passport.initialize());
            app.use(passport.session());
        }
    }
};