hiptillio.controller('HipTillioController', ['$http', 'GetShopDetails', function($http, GetShopDetails) {
  var self = this;

  self.orderItems = []
  self.orderCount = {}
  self.confirmedItems = []
  self.customerDiscount = 0
  var taxRate = 0.0864

  GetShopDetails.success(function(data) {
    self.menu = data
    console.log(self.menu)
  }).error(function(data, status){
      console.log("Error")
  });

  self.addItem = function(newItem, quantity) {
    self.newItem = {itemName: newItem, price: self.menu[0].prices[0][newItem]}
    self.orderItems.push(self.newItem);
  }

  self.completeOrder = function() {
    self.orderItems.forEach(function(item) {
      var key = item.itemName
      self.orderCount[key] = (self.orderCount[key] || 0) + 1
    });

    //how refactor this out into separate method whilst still handling asychronicity?
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

    self.totalItemCost = parseFloat(self.totalItemCost * (1 - self.customerDiscount/100)).toFixed(2)

    //refactor out method > calculate proportion that is tax
    self.taxCost = parseFloat(self.totalItemCost * taxRate).toFixed(2);

    //refactor out method > calculate change
    self.change = parseFloat(self.customerPayment - self.totalItemCost).toFixed(2);
  }

  // function buildFinalOrder(orderCount) {
  //   for (item in orderCount) {
  //     var finalOrderItem = {itemName: item, price: self.menu[0].prices[0][item], quantity: self.orderCount[item]}
  //     self.confirmedItems.push(finalOrderItem)
  //   }
  // }
}])