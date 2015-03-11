var shopInfo = require('./menu')
var total = []
var howMuch


var hipsterList = {
  add: function(item, price) {
    if (shopInfo.prices[item] != undefined) {
     this.list.push(item);
     this.price.push(price)
    }
    else {
      console.log("Sorry item not found")
    }
  },
  getAll: function() {
    return this.list;
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

