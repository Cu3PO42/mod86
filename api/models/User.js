/**
 * User
 *
 * @module      :: Model
 * @description :: A short summary of how this model works and what it represents.
 * @docs		:: http://sailsjs.org/#!documentation/models
 */

var bcrypt = require('bcryptjs');

function hashPassword(user, cb) {
    bcrypt.genSalt(10, function(err, salt) {
        bcrypt.hash(user.password, salt, function(err, hash) {
            if (err) {
                console.log(err);
                cb(err);
            } else {
                user.password = hash;
                cb(null, user);
            }
        });
    });
}

module.exports = {
    attributes: {
        username: {
            type: 'string',
            required: true,
            unique: true
        },
        email: {
            type: 'email',
            required: true,
            unique: true
        },
        password: {
            type: 'string',
            required: true
        },
        realname: {
            type: 'string'
        },
        classmember: {
            model: "Class"
        },
        classadmin: {
            type: "boolean"
        },
        globaladmin: {
            type: "boolean"
        },
        toJSON: function() {
            var obj = this.toObject();
            delete obj.password;
            return obj;
        }
    },
    beforeCreate: hashPassword,
    beforeUpdate: function(vals, cb) {
        delete vals.username;
        if (vals.password !== undefined) {
            hashPassword(vals, cb);
        } else {
            cb(null, vals);
        }
    }
};
