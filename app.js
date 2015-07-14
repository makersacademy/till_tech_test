var fs = require('fs');
var till = require('./src/till.js');


var details = function() {
  var prices = 0;
  fs.readFile('./hipstercoffee.json','utf8', function (err, data) {
    if (err) throw err;
    console.log(prices);
    prices = JSON.parse(data);
  });
  return prices;
};

console.log(details());
