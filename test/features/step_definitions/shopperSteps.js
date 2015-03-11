var NewShopper = require(process.cwd() + '/models/newShopper');
var HipsterList = require(process.cwd() + '/models/hipsterList');
var assert = require('assert');

module.exports = function() {

var shopper;
  name = "Jane"
  newList = HipsterList.create();

 this.Given(/^I am a shopper$/, function(callback) {
    shopper = NewShopper.create();
    callback();
  });

 this.Then(/^I have a name$/, function(callback) {
    shopper.addName(name);
    assert.equal(shopper.name, "Jane")
    callback();
  });

 this.Then(/^I can have a hipster list$/, function(callback){
   shopper.addList();
   newList.add("Tea")
   assert.equal(shopper.showList(), "Tea")
   callback();
 });

 };