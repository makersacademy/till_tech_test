// Server
var express = require('express');
var app = express();
var path = require('path');
var server = require('http').createServer(app);
var hipsterList = require('./public/js/hipsterList');
var bodyParser = require('body-parser');

//data
var port = process.env.PORT || 3000;
var db = new hipsterList();

// Server Set-up
app.set('view engine', 'html');
app.use(express.static(__dirname + '/public'))
app.use(bodyParser.urlencoded({'extended':'true'}));
app.use(bodyParser.json());
app.use(bodyParser.json({ type: 'application/vnd.api+json' }));


function Server(dBase) {
  this.db = dBase;
}

Server.prototype.init = function(port, cBack) {
  _this = this;
  require('./routes/index')(app, _this.db);
  server.listen(port, cBack);
};

if(!module.parent) {
  new Server(db).init(port, function(){
    console.log('Hipsters running at ' + port);
  });
}

module.exports = Server;