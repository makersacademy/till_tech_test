var NewShopper = require(process.cwd() + '/models/newShopper');
var ShopInfo = require(process.cwd() + '/public/js/receiptinfo');
var assert = require('assert');

module.exports = function() {

var Jane;

 this.Given(/^I am a shopper$/, function(callback) {
    Jane = NewShopper.create();
    callback();
  });

 };