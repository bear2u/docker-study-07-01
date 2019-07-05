var express = require('express');
var router = express.Router();

var User = require('../models/user');

/* GET users listing. */
router.get('/', function(req, res, next) {
  User.find({})
    .then( users => {
      res.json(users);
    })  

  // var user = new User();
  // user.name = 'ok';
  // User.create(user)
  //   .then(user => res.json(user));
});

module.exports = router;
