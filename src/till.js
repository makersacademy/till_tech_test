function Till(){

  this.receipt = [];

}

Till.prototype.ring = function(item) {
  this.receipt.push(item);
  this.receipt.push(shopInfo[0].prices[0][item])
};