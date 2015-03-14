var HipsterList = require('../../../public/js/hipsterList');
var assert = require('assert');

module.exports = function() {

  var myList;
    listItem = 'Cafe Latte'
    quantity = 1

  this.Given(/^I have an empty hipster list$/, function(callback) {
    myList = new HipsterList();
    callback();
  });

  this.When(/^I add an item to the list$/, function(callback) {
    myList.add(listItem, quantity)
    callback();
  });

  this.Then(/^The hipster list contains a single item$/, function(callback) {
    assert.equal(myList.getAll().length, 1, 'Hipster List should grow by one item.');
    callback();
  });

  this.Then(/^The hipster list contains two items$/, function(callback) {
    assert.equal(myList.getAll().length, 2, 'Hipster List should grow by two items.');
    callback();
  });

  this.Then(/^I can pay for the total$/, function(callback) {
    assert.equal(myList.getTotal(), 9.50);
    callback();
  });

};