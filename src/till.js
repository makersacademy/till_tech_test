function Till() {
  this.customers = [];
};

Till.prototype.addCustomerName = function (name) {
  this.customers.push(name);
};

Till.prototype.customersNames = function () {
  return this.customers;
};
