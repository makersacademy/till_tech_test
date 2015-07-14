function TillReceipt() {

  var nameOfShop;
  this.confirmedPostTaxOrderTotal = 0;
  this.confirmedPreTaxOrderTotal = 0;
  this.individualOrderPrices = [];
  this.orderItemsWithPrices = [];
  this.calculatedTax = 0;
  this.changeDueToCustomer = 0;

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

  TillReceipt.prototype.customerPayment = function(amountPaid) {
    if (amountPaid >= this.confirmedPostTaxOrderTotal) {
      this.changeDueToCustomer = amountPaid - this.confirmedPostTaxOrderTotal;
    } else {
      throw new Error("Yo mama");
    };
  };

};

// $(document).ready( function() {  
// $.getJSON('hipstercoffee.json',
//   function(data) {        
//      $('#tabs').append(TillReceipt(data));
//      $('#tabs').tabs();
//   });
// });