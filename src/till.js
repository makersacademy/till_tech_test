function Till(){

  this.receipt = {};

  this.receipt.totalCost = 0;
  this.receipt.tax = 0;
  this.receipt.change = 0;
  this.receipt.discount;

  tax_rate = 0.0864;

}

Till.prototype.ring = function(item, quantity) {
  quantity = quantity || 1
  price = shopInfo[0].prices[0][item]

  this.receipt[item] = quantity + ' x ' + price

  this.receipt.totalCost += quantity*price

  if(this.receipt.totalCost > 30){
    this.receipt.discount = '5% discount for purchases over 30'
    this._calculateDiscount();
  }
};

Till.prototype.calculateTax = function(){
  this.receipt.tax = +(tax_rate*this.receipt.totalCost).toFixed(2);
  this.receipt.totalCost += this.receipt.tax
}

Till.prototype.receivePayment = function(payment){
  this.receipt.change = +(payment - this.receipt.totalCost).toFixed(2);
}

Till.prototype._calculateDiscount = function(){
  this.receipt.totalCost = this.receipt.totalCost - (0.05*this.receipt.totalCost);
}