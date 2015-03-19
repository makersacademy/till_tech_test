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
    assert.equal(myList.getAllItems().length, 1, 'Hipster List should grow by one item.');
    callback();
  });

  this.Then(/^The hipster list contains two items$/, function(callback) {
    assert.equal(myList.getAllQuantity(), 2, 'Hipster List should grow by two items.');
    callback();
  });

  this.Then(/^I can pay for the total$/, function(callback) {
    assert.equal(myList.getTotal(), 9.50);
    callback();
  });

  this.When(/^I delete an item from the list$/, function(callback) {
    myList.deleteItem(listItem);
    callback();
  });

  this.Then(/^I do not see the item in my list$/, function(callback) {
    assert.notEqual(myList.getAllItems(), 'Cafe Latte', 'Hipster List should not contain Cafe Latte.');
    callback();
  });
};