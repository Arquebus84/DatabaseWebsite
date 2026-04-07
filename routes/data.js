var express = require('express');
var router = express.Router();

var db = require('./public/database');

router.get('/', function(req, res, next){
    // response.send('send all sample data');
    res.render('example', {title: 'Express'});
});

router.get('/add', function(req, res, next){
    // response.send('sample data');
});

module.exports = router;