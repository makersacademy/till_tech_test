function Till(){

  this.receipt = {};

}

Till.prototype.ring = function(item) {
  this.receipt[item] = shopInfo[0].prices[0][item]
};