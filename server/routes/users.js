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

router.post('/', ({ body : { id, password} }, res, next) => {
  const user = new User();
  user.id = id;
  user.password = password
  return user.save()
    .then(user => res.json(user));  
})

module.exports = router;
