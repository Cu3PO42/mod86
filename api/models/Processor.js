/**
 * Processor
 *
 * @module      :: Model
 * @description :: A short summary of how this model works and what it represents.
 * @docs		:: http://sailsjs.org/#!documentation/models
 */

module.exports = {

  attributes: {
  	pieces: {
      type: "json",
      required: true
    },
    keyboardBindings: {
      type: "json",
      required: true
    },
    name: {
      type: "string",
      required: true
    },
    author: {
      type: "string",
      required: true
    },
    description: {
      type: "string",
      required: true
    },
    global: {
      type: "boolean",
      required: true
    },
    owner: {
      type: "integer",
      required: true
    },
    toJSON: function() {
      var obj = this.toObject();
      delete obj.owner;
      return obj;
    }
  },
  beforeUpdate: function(vals, cb) {
    delete vals.owner;
    delete vals.global;
    cb(null, vals);
  }

};
