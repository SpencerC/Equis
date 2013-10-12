var express = require('express')
  , util = require('util');

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
  res.render('index.jade', { param: req.params.id } );
});

var port = env.PORT || 3000;

app.listen(port);
console.log('Started! Its up! Port:' + port);