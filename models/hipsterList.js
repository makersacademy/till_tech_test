var total = []
var howMuch


var hipsterList = {
  add: function(item, price) {
    this.list.push(item);
    this.price.push(price)
  },
  getAll: function() {
    return this.list;
  },
  getItemIndex: function(value) {
    var index = this.list.length;
    while(--index > -1) {
      if(this.list[index] === value) {
        return index;
      }
    }
    return -1;
  },
  getPriceIndex: function(value) {
    var index = this.price.length;
    while(--index > -1) {
      if(this.price[index] === value) {
        return index;
      }
    }
    return -1;
  },
  getTotal: function() {
    var howMuch = eval(this.price.join('+'))
    return howMuch
  }
};
  

module.exports = {
  create: function() {
    return Object.create(hipsterList,{
      'list': {
        value: [],
        writable: false,
        enumeable: true
      },
      'price':{
        value:[],
        writable: false,
        enumeable: true
      }
    });
  }
};

