function Till(){

  this.receipt = {};
  this.totalCost = 0;

}

Till.prototype.ring = function(item, quantity) {
  quantity = quantity || 1
  price = shopInfo[0].prices[0][item]
  this.receipt[item] = quantity + ' x ' + price
  this.totalCost += quantity*price
};