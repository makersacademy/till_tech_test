function Till(details){
  this.details = details;
  this.taxes = 0;
  this.total = 0;
  this.specialDiscount = 0.1;
  this.discountRate = 0.05;
  this.taxRate = 0.0864;
  this.order = {};
  this.receipt = {};
};


Till.prototype.calculateTotal = function(item) {
  var price = this.fixDecimals(this.calculatePrice(item));
  this.total += price;
  this.total = this.fixDecimals(this.total);
  this.applyDiscount(this.total);
  this.addToOrder(item, price);
};


Till.prototype.calculateTaxes = function() {
  this.taxes = this.fixDecimals(this.total * this.taxRate);
  return this.taxes;
};


Till.prototype.addToOrder = function(item, cost){
  var order = this.order[item];
  if (order) {
    this.order[item].quantity += 1;
    this.order[item].price += cost;
  } else {
    this.order[item] = {quantity: 1, price: cost};
  };
};


Till.prototype.calculateChange = function(note){
  var change = note - this.total;
  return change;
};

Till.prototype.applyDiscount = function(total) {
  if(total > 50) {
    var discount = this.fixDecimals(this.total * this.discountRate);
    this.total -= discount;
  };
};

Till.prototype.calculatePrice = function(item) {
  var price = this.details[0].prices[0][item];
  var discount = this.fixDecimals(price * this.specialDiscount);
    if(item == "Blueberry Muffin"){
      price = price - discount;
      return price;
    } else{
      return price;
    }
};

Till.prototype.createReceipt = function () {
  this.receipt["name"] = this.details[0]["shopName"];
  this.receipt["address"] = this.details[0]["address"];
  this.receipt["taxes"] = this.calculateTaxes();
  this.receipt["date"] = new Date;
  this.receipt["order"] = this.order;
  this.receipt["total"] = this.total;
};

Till.prototype.fixDecimals = function (number) {
  var fixed = +number.toFixed(2);
  return fixed;
};


