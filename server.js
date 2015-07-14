var express = require('express');
var app = express();
var fs = require('fs');

app.use(express.static(__dirname));

app.get('/prices', function (req, res) {
  fs.readFile('./hipstercoffee.json','utf8', function (err, data) {
    if (err) throw err;
    var prices = JSON.parse(data);
    res.send(prices);
  });
});

app.get('/', function (req, res) {
    if (err) throw err;
    res.send('index.html');
});

var server = app.listen(3000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});