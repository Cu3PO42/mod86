module.exports = function(req, res, next) {
    Processor.findOneById(req.params.id, function(err, processor) {
        if (err) res.status(500).send(err);
        else if (processor.owner == req.user.id) {
            next();
        } else {
            res.forbidden("You're not allowed to do this.");
        }
    });
};