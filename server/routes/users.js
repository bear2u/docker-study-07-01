var express = require('express');
var router = express.Router();

var User = require('../models/user');

/* GET users listing. */
router.get('/', function(req, res, next) {
  var user = new User();
  user.name = 'ok';
  User.create(user)
    .then(user => User.find({})
    .then( users => {
      res.json(users);
    }))    
});

router.post('/', ({ body : { id, password} }, res, next) => {
  res.json({ id, password });
})

module.exports = router;
