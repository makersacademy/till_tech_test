function Till(){

  this.receipt = {};

}

Till.prototype.ring = function(item, quantity) {
  quantity = quantity || 1
  this.receipt[item] = quantity + ' x ' + shopInfo[0].prices[0][item]
};