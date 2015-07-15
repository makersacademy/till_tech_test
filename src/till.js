function Till(details){
  this.details = details;
  this.taxes = 0;
  this.total = 0;
  this.date = new Date;
  this.taxRate = 0.0864;
  this.receipt = [];
};


Till.prototype.calculateTotal = function(article, quantity) {
  var price = this.details[0].prices[0][article];
  this.total += price * quantity;
  this.addToList(article, quantity, price);
};


Till.prototype.calculateTaxes = function() {
  this.taxes = +(this.total * this.taxRate).toFixed(1);
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

