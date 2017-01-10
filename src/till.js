function Till() {
  this.customers = [];
  this.tableNum = null;
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
