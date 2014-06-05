
/**
 * ProcessorController
 *
 * @module      :: Controller
 * @description	:: A set of functions called `actions`.
 *
 *                 Actions contain code telling Sails how to respond to a certain type of request.
 *                 (i.e. do stuff, then send some JSON, show an HTML page, or redirect to another URL)
 *
 *                 You can configure the blueprint URLs which trigger these actions (`config/controllers.js`)
 *                 and/or override them with custom routes (`config/routes.js`)
 *
 *                 NOTE: The code you write here supports both HTTP and Socket.io automatically.
 *
 * @docs        :: http://sailsjs.org/#!documentation/controllers
 */

module.exports = {

    find: function(req, res) {
        if (req.params.id) {
            Processor.findOneById(req.params.id, function (err, processor) {
                if (err) res.status(500).send(err);
                else if (!processor) {
                    res.status(404);
                } else if (processor.global || processor.owner == req.user.id) {
                    res.json(processor);
                } else {
                    res.forbidden("This is not one of your processors.");
                }
            });
        } else {
            Processor.find({ global: true }).done(function(err, users1) {
                if (err) res.status(500).send(err);
                else Processor.find({ owner: req.user.id, global: false }).done(function(err, users2) {
                    if (err) res.err(500, err);
                    Array.prototype.push.apply(users1, users2);
                    res.json(users1);
                });
            });
        }
    },

    /**
     * Overrides for the settings in `config/controllers.js`
     * (specific to ProcessorController)
     */
    _config: {}


};
