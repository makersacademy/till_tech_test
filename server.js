// Server
var express = require('express');
var app = express();
var path = require('path');
var server = require('http').createServer(app);
var io = require('socket.io')(server);
var mockDB = require('./mockDB');
var bodyParser = require('body-parser');

//data
var port = process.env.PORT || 3000;
var db = new mockDB();

// Server Set-up
app.set('view engine', 'html');
app.use(express.static(__dirname + '/public'))
app.use(bodyParser.urlencoded({'extended':'true'}));
app.use(bodyParser.json());
app.use(bodyParser.json({ type: 'application/vnd.api+json' }));

io.on('connection', function(socket) {
});

function Server(dBase) {
  this.db = dBase;
}

Server.prototype.init = function(port, cBack) {
  _this = this;
  require('./routes/index')(app, _this.db, io);
  server.listen(port, cBack);
};

if(!module.parent) {
  new Server(db).init(port, function(){
    console.log('Hipsters running at ' + port);
  });
}

module.exports = Server;