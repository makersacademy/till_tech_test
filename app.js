var fs = require('fs');
var till = require('./src/till.js');


var register;

var details = function() {
  fs.readFile('./hipstercoffee.json','utf8', function (err, data) {
    if (err) throw err;
    var prices = JSON.parse(data);
    register = new till.till(prices);
    return register;
  });
};


console.log(details());
