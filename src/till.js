function Till() {
  this.customers = [];
  this.tableNum = null;
  this.orders = {};
};

Till.prototype.addCustomerName = function (name) {
  this.customers.push(name);
};

Till.prototype.customersNames = function () {
  return this.customers;
};

Till.prototype.addTableNumber = function (tableNumber) {
  this.tableNum = tableNumber;
};

Till.prototype.tableNumber = function () {
  return this.tableNum;
};

Till.prototype.addOrder = function (order) {
  var quantity;
  if (order in this.orders) {
    quantity = this.orders[order][0];
    quantity += 1;
    this.orders[order][0] = quantity;
  } else {
    this.orders[order] = [ 1, menu[0].prices[0][order] ];
  }
};

Till.prototype.ordersList = function () {
  return this.orders;
};
