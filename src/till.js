function Till(menu) {

  this.order = [];
  self = this;

  this.shopName = menu.shopName;
  this.address = menu.address;
  this.phone = menu.phone;
  this.prices = menu.prices[0];

  this.add = function(item){
    this.order.push(item);
  };

  this.total = function(){
    self.sum = this.order.reduce(function(a, b) {
      return ((a + b) * 1.0864); });
      };
  }
