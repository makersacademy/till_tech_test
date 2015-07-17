tillReceiptApp.controller('TillReceiptController',[function() {

  var self = this;
  self.shopName = "The Coffee Connection";
  self.address = "123 Lakeside Way";
  self.phone = "16503600708";

  self.confirmedPostTaxOrderTotal = 0.00;
  self.confirmedPreTaxOrderTotal = 0.00;
  self.individualOrderItems = [];
  self.individualOrderPrices = [];
  self.orderItemsWithPrices = [];
  self.calculatedTax = 0.00;
  self.changeDueToCustomer = 0.00;
  self.muffinMessage = '';
  self.overFiftyMessage = '';

// if time, api call to this hipstercoffee.json
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

  self.quantity = [1,2,3,4,5,6,7,8,9,10];

  self.addToOrder = function(itemName, itemQuantity) {
    if (self.ifItemIsOnMenu(itemName)) {
      if (self.isAnInteger(itemQuantity)) {
        for (i=0; i<itemQuantity; i++) {
          self.addItemToOrderAndNotePriceAndName(itemName);
        };
      } else {
        self.addItemToOrderAndNotePriceAndName(itemName);
      };
    };
    self.confirmOrder();
  };

  self.addItemToOrderAndNotePriceAndName = function(itemName) {
    self.addItemAndPriceToOrder(itemName);
    self.takeItemPrice(itemName);
    self.takeItemName(itemName);
  };

  self.isAnInteger = function(itemQuantity) {
    return itemQuantity % 1 === 0;
  };

  self.takeItemPrice = function(itemName) {
    self.individualOrderPrices.push(self.items[itemName]);
  };

  self.takeItemName = function(itemName) {
    self.individualOrderItems.push(itemName);
  };

  self.ifItemIsOnMenu = function(itemName) {
    return self.items[itemName] !== undefined;
  };

  self.addItemAndPriceToOrder = function(itemName) {
    var itemToAddToOrder = self.createHashOfItemAndPrice(itemName);
    self.orderItemsWithPrices.push(itemToAddToOrder);
  };

  self.confirmOrder = function() {
    self.calcOrderTotalBeforeTax();
    self.calculateTax();
    self.calcOrderTotalWithTax();
  };

  self.calcOrderTotalBeforeTax = function() {
    for (i=0; i<self.individualOrderPrices.length; i++) {
      self.roundToTwoDP(self.calcOrderTotalBeforeDiscount());
    };
    if (self.confirmedPreTaxOrderTotal >= 50) {
      self.roundToTwoDP(self.calcFivePercentDiscount());
    };
    for (i=0; i<self.individualOrderItems.length; i++) {
      if (self.individualOrderItems[i].includes("Muffin")) {
        self.roundToTwoDP(self.calcTenPercentDiscount());
      };
    };
  };

  self.calcOrderTotalBeforeDiscount = function() {
    self.confirmedPreTaxOrderTotal = self.roundToTwoDP(self.confirmedPreTaxOrderTotal + self.individualOrderPrices[i]);
  };

  self.calcFivePercentDiscount = function() {
    self.calcDiscount(0.95);
    self.overFiftyMessage = "You received a 5% discount as your order is over £50!";
  };

  self.calcTenPercentDiscount = function() {
    self.calcDiscount(0.9);
    self.muffinMessage = "You received a 10% discount when you ordered your muffin!";
  };

  self.calcDiscount = function(discountAmountPercent) {
    self.confirmedPreTaxOrderTotal = self.roundToTwoDP(self.confirmedPreTaxOrderTotal * discountAmountPercent);
  };

  self.calculateTax = function() {
    self.calculatedTax = self.roundToTwoDP(self.confirmedPreTaxOrderTotal* 0.0864);
    return self.calculatedTax;
  };

  self.calcOrderTotalWithTax = function() {
    self.confirmedPostTaxOrderTotal = self.roundToTwoDP(self.confirmedPreTaxOrderTotal + self.calculatedTax);
  };

  self.roundToTwoDP = function(number) {
    return Number(Math.round(number+'e2')+'e-2');
  };

  self.createHashOfItemAndPrice = function(itemName) {
    var itemToAddToOrder = {};
    itemToAddToOrder[itemName] = self.items[itemName];
    return itemToAddToOrder;
  };

  self.customerPayment = function(amountPaid) {
    if (amountPaid >= self.confirmedPostTaxOrderTotal) {
      self.changeDueToCustomer = self.roundToTwoDP(amountPaid - self.confirmedPostTaxOrderTotal);
    } else {
      throw new Error("This amount does not cover the bill");
    };
  };

}]);