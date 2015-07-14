function Order () {
  this.items = {};
}

Order.prototype.addItem = function(item) {
  if(this.items[item]) {
    this.items[item] += 1;
  } else {
    this.items[item] = 1;
  }
};