function Till() {
  this.customers = [];
  this.tableNum = null;
  this.orders = {};
  this.taxRate = 8.64;
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

Till.prototype.subTotal = function () {
  var total = 0;
  var orderTotal = 0;
  for (order in this.orders) {
    orderTotal = this.orders[order][0] * this.orders[order][1];
    total += orderTotal
  }
  return total;
};

Till.prototype.calculateTax = function () {
  var total = this.subTotal();
  var tax = (total / 100) * this.taxRate;
  var rounded = Math.ceil(tax * 100)/100;
  return rounded;
};
