// Server
var express = require('express');
var app = express();
var server = require('http').createServer(app);

// Router
var index = require('./routes/index');

// Server Set-up
app.set('view engine', 'ejs');

app.use(express.static(__dirname + '/public'))
app.use('/', index);

app.set('port', (process.env.PORT || 3000));

server.listen(app.get('port'), function(){
  console.log('Server runing at' + app.get('port'));
});

module.exports = server;