function TillReceipt() {

  var nameOfShop;
  var calculatedTax;
  var orderItemsWithPrices;
  var individualOrderPrices;
  var confirmedPreTaxOrderTotal;
  this.confirmedPostTaxOrderTotal = 0;
  this.confirmedPreTaxOrderTotal = 0;
  this.individualOrderPrices = [];
  this.orderItemsWithPrices = [];
  this.calculatedTax = 0;

// representing json object
  this.items = {"Cafe Latte": 4.75, "Flat White": 4.75, "Cappucino": 3.85,}; 

  TillReceipt.prototype.nameOfCoffeeShop = function(coffeeShopName) {
    this.nameOfShop = coffeeShopName;
  };

  TillReceipt.prototype.addToOrder = function(itemName) {
    if (this.ifItemIsOnMenu(itemName)) {
      this.addItemAndPriceToOrder(itemName);
      this.takeItemPrice(itemName);
    };
  };

  TillReceipt.prototype.takeItemPrice = function(itemName) {
    this.individualOrderPrices.push(this.items[itemName]);
  };

  TillReceipt.prototype.ifItemIsOnMenu = function(itemName) {
    return this.items[itemName] !== undefined;
  };

  TillReceipt.prototype.addItemAndPriceToOrder = function(itemName) {
    var itemToAddToOrder = this.createHashOfItemAndPrice(itemName);
    this.orderItemsWithPrices.push(itemToAddToOrder);
  };

// to confirm order, we want to add up and output the values in the orderItemsWithPrices and also

  TillReceipt.prototype.confirmOrder = function() {
    this.findOrderTotalBeforeTax();
    this.calculateTax();
    this.findOrderTotalWithTax();
  };

  TillReceipt.prototype.findOrderTotalBeforeTax = function() {
    for (i=0; i<this.individualOrderPrices.length; i++) {
      this.confirmedPreTaxOrderTotal = this.confirmedPreTaxOrderTotal + this.individualOrderPrices[i];
    };
  };

  TillReceipt.prototype.calculateTax = function() {
    this.calculatedTax = this.roundToTwoDP(this.confirmedPreTaxOrderTotal* 0.0864);
    return this.calculatedTax;
  };

  TillReceipt.prototype.findOrderTotalWithTax = function() {
    this.confirmedPostTaxOrderTotal = this.confirmedPreTaxOrderTotal + this.calculatedTax;
  };

  TillReceipt.prototype.roundToTwoDP = function(number) {
    return Number(Math.round(number+'e2')+'e-2');
  };

  TillReceipt.prototype.createHashOfItemAndPrice = function(itemName) {
    var itemToAddToOrder = {};
    itemToAddToOrder[itemName] = this.items[itemName];
    return itemToAddToOrder;
  };

};

// $(document).ready( function() {  
// $.getJSON('hipstercoffee.json',
//   function(data) {        
//      $('#tabs').append(TillReceipt(data));
//      $('#tabs').tabs();
//   });
// });