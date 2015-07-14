function TillReceipt() {

  var nameOfShop;
  var individualOrderPrices;
  var orderItemsWithPrices;
  this.orderItemsWithPrices = [];
  this.individualOrderPrices = [];
  var confirmedOrderTotal;
  this.confirmedOrderTotal = 0;

// representing json object
  this.items = {"Cafe Latte": 4.75, "Flat White": 4.75, "Cappucino": 3.85,}; 

  TillReceipt.prototype.nameOfCoffeeShop = function(coffeeShopName) {
    this.nameOfShop = coffeeShopName;
    return nameOfShop;
  };

  TillReceipt.prototype.addToOrder = function(itemName) {
    if (this.ifItemIsOnMenu(itemName)) {
      this.addItemAndPriceToOrder(itemName);
      this.individualOrderPrices.push(this.items[itemName])
    };
  };

  TillReceipt.prototype.ifItemIsOnMenu = function(itemName) {
    return this.items[itemName] !== undefined;
  };

  TillReceipt.prototype.addItemAndPriceToOrder = function(itemName) {
    var itemToAddToOrder = {};
    itemToAddToOrder[itemName] = this.items[itemName];
    this.orderItemsWithPrices.push(itemToAddToOrder);
  };

// to confirm order, we want to add up and output the values in the orderItemsWithPrices and also

  TillReceipt.prototype.confirmOrder = function() {
    this.findOrderTotal();
    console.log(this.confirmedOrderTotal);
  };

  TillReceipt.prototype.findOrderTotal = function() {
    for (i=0; i<this.individualOrderPrices.length; i++) {
      console.log("hello")
      this.confirmedOrderTotal = this.confirmedOrderTotal + this.individualOrderPrices[i];
      console.log(confirmedOrderTotal);
    };
    return this.confirmedOrderTotal;
  };

};

// $(document).ready( function() {  
// $.getJSON('hipstercoffee.json',
//   function(data) {        
//      $('#tabs').append(TillReceipt(data));
//      $('#tabs').tabs();
//   });
// });