var express = require('express');
var app = express();
var fs = require('fs');
var bodyParser = require('body-parser');



app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(__dirname +'/public'));

app.get('/', function (req, res, err) {
    if (err) throw err;
    res.send('index.html');
});

var server = app.listen(3000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Till server listening at http://%s:%s', host, port);
});

app.get('/prices', function (req, res) {
  fs.readFile('./hipstercoffee.json','utf8', function (err, data) {
    if (err) throw err;
    var prices = JSON.parse(data);
    res.send(prices);
  });
});

app.post('/', function(req, res, error) {
  var data = req.body;
  var fileName = "receipt.txt";
  res.setHeader('Content-disposition', 'attachment; filename=' + fileName);
  res.set('Content-Type', 'text/csv');
  res.charset = 'binary';
  res.send(data);
});

app.get('/test', function (req, res) {
  var options = {
    root: (__dirname + '/public')
  };
  res.sendFile('test.html', options, function(err) {
    if(err) {
      console.log(err);
    } else {
      console.log('success');
    };
  });
});
