var HipsterList = require(process.cwd() + '/models/hipsterList');
var ShopInfo = require(process.cwd() + '/public/js/receiptinfo');
var assert = require('assert');

module.exports = function() {

  var myList;
    listItem = {'Cafe Latte': 4.75}

  this.Given(/^I have an empty hipster list$/, function(callback) {
    myList = HipsterList.create();
    callback();
  });

  this.When(/^I add an item to the list$/, function(callback) {
    myList.add(listItem)
    callback();
  });

  this.Then(/^The hipster list contains a single item$/, function(callback) {
    assert.equal(myList.getAll().length, 1, 'Hipster List should grow by one item.');
    callback();
  });

  this.Then(/^The hipster list contains two items$/, function(callback) {
    assert.equal(myList.getAll().length, 2, 'Hipster List should grow by one item.');
    callback();
  });

  this.Then(/^I can access that item from the hipster list$/, function(callback) {
    assert.notEqual(myList.getItemIndex(listItem), -1, 'Added item should not be found at non-negaive index,');
    callback();
  });

  this.Then(/^I can find out how much it costs$/, function(callback){
    assert.equal(myList.getValueOf(listItem), 4.75, 'Shopper can get the value of item');
    callback();
  });

  this.Then(/^Pay for the total$/, function(callback) {
    assert.equal(myList.getTotal(), 9.5)
    callback();
  });

};