var express = require('express');
var router = express.Router();

var User = require('../models/user');

/* GET users listing. */
router.get('/', function(req, res, next) {
  User.find({})
    .then( users => {
      res.json(users);
    })  
});

module.exports = router;
