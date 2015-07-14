function Till(){

  this.receipt = {};
  this.totalCost = 0;

  tax_rate = 0.0864;

  this.tax = 0;

}

Till.prototype.ring = function(item, quantity) {
  quantity = quantity || 1
  price = shopInfo[0].prices[0][item]

  this.receipt[item] = quantity + ' x ' + price

  this.totalCost += quantity*price
};

Till.prototype.calculateTax = function(){
  this.tax = tax_rate*this.totalCost
  return this.tax;
}