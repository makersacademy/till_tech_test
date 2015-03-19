
function HipsterList(cBack) {
//menu items
 this.shopInfo =
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
      };
    this.list = [];
    this.price = [];
    this.total = [];
    this.quantity = [];
    this.payment = [];

}

//functions for list
  HipsterList.prototype.add = function(item, quantity) {
    if (this.list.indexOf(item) == -1) {
       this.list.push(item);
       var price = (this.shopInfo.prices[item] * quantity).toFixed(2);
       this.price.push(price);
       this.quantity.push(quantity);
     }
    else {
       var index = this.list.indexOf(item)
       // note this is a really good way convert strings to numbers and add
       this.price[index] = +(this.price[index]) + +(this.shopInfo.prices[item]
        * quantity).toFixed(2);
       this.quantity[index] = +this.quantity[index] + +quantity
    }
  };
  
  HipsterList.prototype.getAllPrice = function() {
    return this.price
  };

  HipsterList.prototype.getAllItems = function() {
    return this.list
  };

  HipsterList.prototype.getAllQuantity = function() {
    return this.quantity
  };

  HipsterList.prototype.getTotal = function() {
    if (this.price.length > 0)
      this.total = eval(this.price.join('+')).toFixed(2);
    else {
      this.total = 0
    }
    return this.total;
  };

  HipsterList.prototype.getTax = function() {
    return (this.total * (8.64/100)).toFixed(2)
  };

  HipsterList.prototype.afterTax = function() {
    return (+this.total + (+this.total * +(8.64/100))).toFixed(2)
  };

  HipsterList.prototype.deleteItem = function(item){
    var index = this.list.indexOf(item);
    this.list.splice(index, 1);
    this.price.splice(index, 1);
    this.quantity.splice(index, 1);
  };

  HipsterList.prototype.getMoney = function(money) {
    if (money != undefined)
      this.payment = []
      this.payment.push(money);
  };

  HipsterList.prototype.getChange = function(){
    return (+this.payment - (+this.total + (+this.total * +(8.64/100)))).toFixed(2)

  };

  HipsterList.prototype.clearDB = function(){
    this.list = []
    this.price = []
    this.total = []
    this.quantity = []
    return this.payment = []
  };
  


module.exports = HipsterList;


