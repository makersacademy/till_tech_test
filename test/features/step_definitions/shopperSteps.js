var HipsterList = require('../../../public/js/hipsterList');
var NewShopper = require('../../../public/js/newShopper');
var assert = require('assert');

module.exports = function() {

var shopper;
  name = "Jane"
  newList = new HipsterList();

 this.Given(/^I am a shopper$/, function(callback) {
    shopper = new NewShopper();
    callback();
  });

 this.Then(/^I have a name$/, function(callback) {
    shopper.addName(name);
    assert.equal(shopper.name, "Jane")
    callback();
  });

 // this.Then(/^I can have a hipster list$/, function(callback){
 //   shopper.addList();
 //   newList.add("Tea")
 //   assert.equal(shopper.showList(), "Tea")
 //   callback();
 // });

 };