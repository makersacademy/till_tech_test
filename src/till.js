function Till(){

  this.receipt = {};

  this.receipt.totalCost = 0;
  this.receipt.tax = 0;

  tax_rate = 0.0864;

}

Till.prototype.ring = function(item, quantity) {
  quantity = quantity || 1
  price = shopInfo[0].prices[0][item]

  this.receipt[item] = quantity + ' x ' + price

  this.receipt.totalCost += quantity*price
};

Till.prototype.calculateTax = function(){
  this.receipt.tax = tax_rate*this.receipt.totalCost
  return this.receipt.tax;
}