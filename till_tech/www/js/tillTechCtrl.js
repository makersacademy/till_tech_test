hiptillio.controller('HipTillioController', [function() {
  var self = this;

  self.orderItems = []
  self.orderCount = {}
  self.confirmedItems = []
  var taxRate = 0.0864

  self.addItem = function(newItem) {
    self.newItem = {itemName: newItem, price: self.menu[0].prices[0][newItem]}
    self.orderItems.push(self.newItem);
  }

  self.completeOrder = function() {
    self.orderItems.forEach(function(item) {
      var key = item.itemName
      self.orderCount[key] = (self.orderCount[key] || 0) + 1
    });

    //refactor out method > build final order
    for (item in self.orderCount) {
      var finalOrderItem = {itemName: item, price: self.menu[0].prices[0][item], quantity: self.orderCount[item]}
      self.confirmedItems.push(finalOrderItem)
    }

    //refactor out method > calculate total cost
    self.costs = []
    self.confirmedItems.forEach(function(item) {
      var itemCost = item.price * item.quantity
      self.costs.push(itemCost)
    })
    self.totalItemCost = self.costs.reduce(function(x,y) {
      return x + y;
    })

    //refactor out method > calculate proportion that is tax
    self.taxCost = parseFloat(self.totalItemCost * taxRate).toFixed(2);
  }

  //refactor into an API
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