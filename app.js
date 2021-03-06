var express = require('express')
  , util = require('util');

var app = express();
// configure Express
app.configure(function() {
  app.use(express.logger());
  app.use(express.cookieParser());
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(express.session({ secret: 'food cat' }));
  app.use(app.router);
  app.enable("jsonp callback");
});

app.get('/eqs/:id', function(req, res){
  
});

app.get('/', function(req, res){
  res.redirect('/eqs/4242424242');
});

var port = process.env.PORT || 3000;

app.listen(port);
console.log('Started! Its up! Port:' + port);