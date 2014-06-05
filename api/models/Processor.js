/**
 * Processor
 *
 * @module      :: Model
 * @description :: A short summary of how this model works and what it represents.
 * @docs		:: http://sailsjs.org/#!documentation/models
 */

module.exports = {

  attributes: {
  	processor: {
      type: "json",
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
