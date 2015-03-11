var shopInfo = require('./menu')
var total = []
var howMuch

//functions for list
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
    var howMuch = (eval(this.price.join('+'))/ 100 * 8.64)
    return howMuch
  }
};
  
//create a new list for shoppers
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

