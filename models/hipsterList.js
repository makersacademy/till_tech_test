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

