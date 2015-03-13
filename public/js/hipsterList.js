var total = []
var howMuch

//menu items
var shopInfo =
      {
        "shopName": "The Coffee Connection",
        "address": "123 Lakeside Way",
        "phone": "16503600708",
        "prices": 
          {
            "Cafe Latte": 4.75,
            "Flat White": 4.75,
            "Cappucino": 3.85,
            "Single Espresso": 2.05,
            "Double Espresso": 3.75,
            "Americano": 3.75,
            "Cortado": 4.55,
            "Tea": 3.65,
            "Choc Mudcake": 6.40,
            "Choc Mousse": 8.20,
            "Affogato": 14.80,
            "Tiramisu": 11.40,
            "Blueberry Muffin": 4.05,
            "Chocolate Chip Muffin": 4.05,
            "Muffin Of The Day": 4.55
          }
      }



//functions for list
var hipsterList = {
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
  },

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
var newShopper = {
  create: function() {
    return Object.create(newShopper,{
      'name': {
        value: [],
        writable: false,
        enumeable: true
      },
    });
  },
  addName: function(name){
    this.name.push(name);
    return name
  },
  name: function(){
    return this.name
  },
  addList: function(){
    newList = HipsterList.create();
  },
  showList: function(){
    return newList.list;
  }
}






