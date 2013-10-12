var express = require('express')
  , util = require('util')
  , Firebase = require('firebase');

var app = express();
// configure Express
app.configure(function() {
  app.set('views', __dirname + '/src/jade');
  app.set('view engine', 'jade');
  app.use(express.static(__dirname + '/public'));
  app.use(express.logger());
  app.use(express.cookieParser());
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(express.session({ secret: 'food cat' }));
  app.use(app.router);
  app.enable("jsonp callback");
});

app.get('/', function(req, res){
  res.render('index.jade', { title: "cool" });
});

app.get('/eqs/:id', function(req, res) {
  var ref = new Firebase('http://equis1414.firebaseio.com/'+req.params.id);
  console.log(req.params.id);
  ref.once('value', function(s) {
    res.render('index.jade', { param: req.params.id, TeX: s.val().TeX } );
  });
});

var port = 3000;

app.listen(port);
console.log('Started! Its up! Port:'+port);