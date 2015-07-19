hiptillio.controller('HipTillioController', ['$http', 'GetShopDetails', function($http, GetShopDetails) {
  var self = this;

  self.orderItems = []
  self.orderCount = {}
  self.confirmedItems = []
  self.customerDiscount = 0
  var taxRate = 0.0864

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
  self.resetOrder = function() {
    self.orderItems = []
    self.orderCount = {}
    self.confirmedItems = []
    self.costs = []
    self.totalItemCost = 0
    self.taxCost = 0
    self.change = 0
    self.customerDiscount = 0
    self.customerPayment = 0
  }

  // GetShopDetails.success(function(data) {
  //   self.menu = data
  //   console.log(self.menu)
  // }).error(function(data, status){
  //     console.log("Error")
  // });

  self.addItem = function(newItem) {
    self.newItem = {itemName: newItem, price: self.menu[0].prices[0][newItem]}
    console.log(self.newItem.price)
    if (self.newItem.price == undefined) {
      alert("That item is not on the menu - please check from Cafe Latte, Flat White, Cappucino, Single Espresso, Double Espresso, Americano, Cortado, Tea, Choc Mudcake, Choc Mousse, Affogato, Tiramisu, Blueberry Muffin, Chocolate Chip Muffin, Muffin Of The Day")
    }else {
      self.orderItems.push(self.newItem);
    }
  }

  self.checkCustomerDetails = function() {
    console.log(self.customerDiscount)
    console.log(self.customerPayment)
    if (isNaN(self.customerDiscount) || self.customerDiscount > 100 || self.customerDiscount < 0 || isNaN(self.customerPayment) || self.customerPayment < 0) {
        alert("Please reset order and enter a valid Customer Payment or Discount")
      }
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

    self.costs = []
    self.confirmedItems.forEach(function(item) {
      var itemCost = item.price * item.quantity
      self.costs.push(itemCost)
    })
    self.totalItemCost = self.costs.reduce(function(x,y) {
      return x + y;
    })

     self.totalItemCost = parseFloat(self.totalItemCost * (1 - self.customerDiscount/100)).toFixed(2)

     self.taxCost = parseFloat(self.totalItemCost * taxRate).toFixed(2);

     self.change = parseFloat(self.customerPayment - self.totalItemCost).toFixed(2);
    }
}])