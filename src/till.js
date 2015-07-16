function Till(details){
  this.details = details;
  this.taxes = 0;
  this.total = 0;
  this.specialDiscount = 0.1;
  this.discountRate = 0.05;
  this.date = new Date;
  this.taxRate = 0.0864;
  this.receipt = [];
};


Till.prototype.calculateTotal = function(item, quantity) {
  var price = +(this.calculatePrice(item)).toFixed(2);
  this.total += price * quantity;
  this.applyDiscount(this.total);
  this.addToList(item, quantity, price);
};


Till.prototype.calculateTaxes = function() {
  this.taxes = +(this.total * this.taxRate).toFixed(2);
};


Till.prototype.addToList = function(item, quantity, price){
  var line = {order: item, quantity: quantity, price: price};
  this.receipt.push(line);
};


Till.prototype.calculateChange = function(note){
  var change = note - this.total;
  return change;
};

Till.prototype.applyDiscount = function(total) {
  if(total > 50) {
    var discount = +(this.total * this.discountRate).toFixed(2);
    this.total -= discount;
  };
};

Till.prototype.calculatePrice = function(item) {
  var price = this.details[0].prices[0][item];
  var discount = +(price * this.specialDiscount).toFixed(2);
  if(item == "Blueberry Muffin"){
    price = price - discount;
    return price;
  } else{
    return price;
  }
};


var till;

function createTill() {
  $.ajax({ url: '/prices',
    type: 'GET'
  }).done(function(data){
    till = new Till(data);
  });
};

