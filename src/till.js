function Till(details){
  this.details = details;
  this.subtotal = 0;
  this.total = 0;
  this.date = new Date;
  this.tax = 0.0864;
  this.receipt = [];
};


Till.prototype.calculateSubtotal = function(article, quantity) {
  var price = this.details[0].prices[0][article];
  this.subtotal += price * quantity;
  this.addToList(article, quantity, price);
};


Till.prototype.calculateTotal = function() {
  var taxes = +(this.subtotal * this.tax).toFixed(1);
  this.total = taxes + this.subtotal;
};


Till.prototype.addToList = function(item, quantity, price){
  var line = {order: item, quantity: quantity, price: price};
  this.receipt.push(line);
};


Till.prototype.calculateChange = function(note){
  var change = note - this.total;
  return change;
};


var till;

function details() {
  $.ajax({ url: '/prices',
    type: 'GET'
  }).done(function(data){
    till = new Till(data);
  });
};

