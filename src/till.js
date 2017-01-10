function Till() {
  this.customers = [];
  this.tableNum = null;
  this.orders = {};
  this.taxRate = 8.64;
  this.thresholdDiscountPercentage = 5;
  this.muffinDiscountPercentage = 10;
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

Till.prototype.listOrders = function () {
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

Till.prototype.printReceipt = function () {
  var receipt = { "shopName": menu[0].shopName,
                "address": menu[0].address,
                "phone": menu[0].phone,
                "customer": this.customersNames(),
                "table": this.tableNumber(),
                "orders": this.listOrders(),
                "taxRate": this.taxRate,
                "tax": this.calculateTax(),
                "subTotal": this.subTotal(),
                "thresholdDiscount": this.thresholdDiscount(),
                "muffinDiscount": this.muffinDiscount(),
                "amountDue": this.finalTotal()
              }
  return receipt;
};

Till.prototype.makePayment = function (amount) {
  if (amount >= this.subTotal()){
   var change = (amount * 10 - this.subTotal() * 10) / 10;
   return change;
  } else {
   return "Insufficient payment, the total is " + this.subTotal();
  }
};

Till.prototype.thresholdDiscount = function () {
  var discount;
  if (this.subTotal() > 50) {
    discount = (this.subTotal() / 100) * this.thresholdDiscountPercentage;
  return Math.floor(discount * 100) / 100;
  }
  return 0;
};

Till.prototype.muffinDiscount = function () {
  var discount;
  var orderTotal = 0;
  for (order in this.orders) {
    if (order == "Blueberry Muffin" || order == "Chocolate Chip Muffin") {
      orderTotal += this.orders[order][0] * this.orders[order][1];
    }
  }
  discount = orderTotal / 100 * this.muffinDiscountPercentage;
  return Math.floor(discount * 100) / 100;
};

Till.prototype.finalTotal = function () {
  if (this.subTotal() < 50) {
    return (this.subTotal() * 100 - this.muffinDiscount() * 100) / 100;
  } else {
    return (this.subTotal() * 100 - (this.thresholdDiscount() * 100 + this.muffinDiscount() * 100)) / 100;
  }
};
