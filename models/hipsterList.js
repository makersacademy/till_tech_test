var val 
var total = []

var hipsterList = {
  add: function(item) {
    this.list.push(item);
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
  getValueOf: function(obj) {
 
    var keys = Object.keys(obj);

    for (var i = 0; i < keys.length; i++) {
       val = obj[keys[i]];  
    }
   putInHipList(val);
   return val
  },
  getTotal: function() {
    var howMuch = eval(total.join('+'))
    return howMuch
  }
};

var putInHipList = function(val) {
  total.push(val)
  return total
};


module.exports = {
  create: function() {
    return Object.create(hipsterList,{
      'list': {
        value: [],
        writable: false,
        enumeable: true
      }
    });
  }
};

