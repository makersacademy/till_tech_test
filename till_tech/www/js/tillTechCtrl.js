hiptillio.controller('HipTillioController', [function() {
  var self = this;

  self.orderItems = []
  self.orderCount = {}
  self.confirmedItems = []

  self.addItem = function(newItem) {
    self.newItem = {itemName: newItem, price: self.menu[0].prices[0][newItem]}
    self.orderItems.push(self.newItem);
  }

  self.completeOrder = function() {
    self.orderItems.forEach(function(item) {
      var key = item.itemName
      self.orderCount[key] = (self.orderCount[key] || 0) + 1
    });

    for (item in self.orderCount) {
      var finalOrderItem = {itemName: item, price: self.menu[0].prices[0][item], quantity: self.orderCount[item]}
      self.confirmedItems.push(finalOrderItem)
    }
  }

  self.menu = [
      {
        "shopName": "The Coffee Connection",
        "address": "123 Lakeside Way",
        "phone": "16503600708",
        "prices": [
          {
            "Cafe Latte": 4.75,
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
          }
        ]
      }
    ]
}])