tillReceiptApp.controller('TillReceiptController',[function() {

  var self = this;
  var nameOfShop;
  self.confirmedPostTaxOrderTotal = 0;
  self.confirmedPreTaxOrderTotal = 0;
  self.individualOrderItems = [];
  self.individualOrderPrices = [];
  self.orderItemsWithPrices = [];
  self.calculatedTax = 0;
  self.changeDueToCustomer = 0;

  self.items = {"Cafe Latte": 4.75,
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

  self.quantity = [1,2,3,4,5,6,7,8,9,10]

  self.nameOfCoffeeShop = function(coffeeShopName) {
    this.nameOfShop = coffeeShopName;
  };

  self.addToOrder = function(itemName, itemQuantity) {
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

  self.addItemToOrderAndNotePriceAndName = function(itemName) {
    this.addItemAndPriceToOrder(itemName);
    this.takeItemPrice(itemName);
    this.takeItemName(itemName);
  };

  self.isAnInteger = function(itemQuantity) {
    return itemQuantity % 1 === 0;
  };

  self.takeItemPrice = function(itemName) {
    this.individualOrderPrices.push(this.items[itemName]);
  };

  self.takeItemName = function(itemName) {
    this.individualOrderItems.push(itemName);
  };

  self.ifItemIsOnMenu = function(itemName) {
    return this.items[itemName] !== undefined;
  };

  self.addItemAndPriceToOrder = function(itemName) {
    var itemToAddToOrder = this.createHashOfItemAndPrice(itemName);
    this.orderItemsWithPrices.push(itemToAddToOrder);
  };

  self.confirmOrder = function() {
    this.calcOrderTotalBeforeTax();
    this.calculateTax();
    this.calcOrderTotalWithTax();
  };

  self.calcOrderTotalBeforeTax = function() {
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

  self.calcOrderTotalBeforeDiscount = function() {
    this.confirmedPreTaxOrderTotal = this.confirmedPreTaxOrderTotal + this.individualOrderPrices[i];
  };

  self.calcFivePercentDiscount = function() {
    this.calcDiscount(0.95);
    console.log("5% discount on orders over £50");
  };

  self.calcTenPercentDiscount = function() {
    this.calcDiscount(0.9);
    console.log("10% discount on orders including muffins");
  };

  self.calcDiscount = function(discountAmountPercent) {
    this.confirmedPreTaxOrderTotal = this.roundToTwoDP(this.confirmedPreTaxOrderTotal * discountAmountPercent);
  };

  self.calculateTax = function() {
    this.calculatedTax = this.roundToTwoDP(this.confirmedPreTaxOrderTotal* 0.0864);
    return this.calculatedTax;
  };

  self.calcOrderTotalWithTax = function() {
    this.confirmedPostTaxOrderTotal = this.confirmedPreTaxOrderTotal + this.calculatedTax;
  };

  self.roundToTwoDP = function(number) {
    return Number(Math.round(number+'e2')+'e-2');
  };

  self.createHashOfItemAndPrice = function(itemName) {
    var itemToAddToOrder = {};
    itemToAddToOrder[itemName] = this.items[itemName];
    return itemToAddToOrder;
  };

  self.customerPayment = function(amountPaid) {
    if (amountPaid >= this.confirmedPostTaxOrderTotal) {
      this.changeDueToCustomer = amountPaid - this.confirmedPostTaxOrderTotal;
    } else {
      throw new Error("This amount does not cover the bill");
    };
  };

}]);