
// Server
var express = require('express');
var app = express();
var server = require('http').createServer(app);
var bodyParser = require('body-parser');

// Server Set-up
app.set('view engine', 'html');
app.use(express.static(__dirname + '/public'))
app.use(bodyParser.urlencoded({'extended':'true'}));
app.use(bodyParser.json());
app.use(bodyParser.json({ type: 'application/vnd.api+json' }));

// Router
var index = require('./routes/index');

// Server Set-up
app.set('view engine', 'ejs');

app.use(express.static(__dirname + '/public'))

app.use('/', index);

app.set('port', (process.env.PORT || 3000));

server.listen(app.get('port'), function(){
  console.log('Hipsters running at ' + app.get('port'));
});

module.exports = server;