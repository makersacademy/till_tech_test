function TillReceipt() {

  var nameOfShop;
  this.confirmedPostTaxOrderTotal = 0;
  this.confirmedPreTaxOrderTotal = 0;
  this.individualOrderItems = [];
  this.individualOrderPrices = [];
  this.orderItemsWithPrices = [];
  this.calculatedTax = 0;
  this.changeDueToCustomer = 0;

// representing json object
  this.items = {"Cafe Latte": 4.75,
                "Flat White": 4.75,
                "Cappucino": 3.85,
                "Single Espresso": 2.05,
                "Double Espresso": 3.75,
                "Americano": 3.75,
                "Cortado": 4.55,
                "Tea": 3.65,
                "Choc Mudcake": 6.40,
                "Choc Mousse": 8.20,
                "Affogato": 14.80,
                "Tiramisu": 11.40,
                "Blueberry Muffin": 4.05,
                "Chocolate Chip Muffin": 4.05,
                "Muffin Of The Day": 4.55
  }; 

  TillReceipt.prototype.nameOfCoffeeShop = function(coffeeShopName) {
    this.nameOfShop = coffeeShopName;
  };

  TillReceipt.prototype.addToOrder = function(itemName, itemQuantity) {
    if (this.ifItemIsOnMenu(itemName)) {
      if (this.isAnInteger(itemQuantity)) {
        for (i=0; i<itemQuantity; i++) {
          this.addItemToOrderAndNotePriceAndName(itemName);
        };
      } else {
        this.addItemToOrderAndNotePriceAndName(itemName);
      };
    };
  };

  TillReceipt.prototype.addItemToOrderAndNotePriceAndName = function(itemName) {
    this.addItemAndPriceToOrder(itemName);
    this.takeItemPrice(itemName);
    this.takeItemName(itemName);
  };

  TillReceipt.prototype.isAnInteger = function(itemQuantity) {
    return itemQuantity % 1 === 0;
  };

  TillReceipt.prototype.takeItemPrice = function(itemName) {
    this.individualOrderPrices.push(this.items[itemName]);
  };

  TillReceipt.prototype.takeItemName = function(itemName) {
    this.individualOrderItems.push(itemName);
  };

  TillReceipt.prototype.ifItemIsOnMenu = function(itemName) {
    return this.items[itemName] !== undefined;
  };

  TillReceipt.prototype.addItemAndPriceToOrder = function(itemName) {
    var itemToAddToOrder = this.createHashOfItemAndPrice(itemName);
    this.orderItemsWithPrices.push(itemToAddToOrder);
  };

  TillReceipt.prototype.confirmOrder = function() {
    this.calcOrderTotalBeforeTax();
    this.calculateTax();
    this.calcOrderTotalWithTax();
  };

  TillReceipt.prototype.calcOrderTotalBeforeTax = function() {
    for (i=0; i<this.individualOrderPrices.length; i++) {
      this.calcOrderTotalBeforeDiscount();
    };
    if (this.confirmedPreTaxOrderTotal >= 50) {
      this.calcFivePercentDiscount();
    };
    for (i=0; i<this.individualOrderItems.length; i++) {
      if (this.individualOrderItems[i].includes("Muffin")) {
        this.calcTenPercentDiscount();
      };
    };
  };

  TillReceipt.prototype.calcOrderTotalBeforeDiscount = function() {
    this.confirmedPreTaxOrderTotal = this.confirmedPreTaxOrderTotal + this.individualOrderPrices[i];
  };

  TillReceipt.prototype.calcFivePercentDiscount = function() {
    this.calcDiscount(0.95);
    console.log("5% discount on orders over £50");
  };

  TillReceipt.prototype.calcTenPercentDiscount = function() {
    this.calcDiscount(0.9);
    console.log("10% discount on orders including muffins");
  };

  TillReceipt.prototype.calcDiscount = function(discountAmountPercent) {
    this.confirmedPreTaxOrderTotal = this.roundToTwoDP(this.confirmedPreTaxOrderTotal * discountAmountPercent);
  };

  TillReceipt.prototype.calculateTax = function() {
    this.calculatedTax = this.roundToTwoDP(this.confirmedPreTaxOrderTotal* 0.0864);
    return this.calculatedTax;
  };

  TillReceipt.prototype.calcOrderTotalWithTax = function() {
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
      throw new Error("This amount does not cover the bill");
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