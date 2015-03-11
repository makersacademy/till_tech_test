var NewShopper = require(process.cwd() + '/models/newShopper');
var ShopInfo = require(process.cwd() + '/public/js/receiptinfo');
var assert = require('assert');

module.exports = function() {

var shopper;
  name = "Jane"

 this.Given(/^I am a shopper$/, function(callback) {
    shopper = NewShopper.create();
    callback();
  });

 this.Then(/^I have a name$/, function(callback) {
    shopper.addName(name);
    assert.equal(shopper.name, "Jane")
    callback();
  });

 };