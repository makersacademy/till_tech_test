function Till () {
  this.total = 0;
  this.order = [];
}

Till.prototype.addItem = function(item) {
  this.order[item] = 1;
};

// Till.prototype.callTotal = function() {
//   data = [
//     {
//       "shopName": "The Coffee Connection",
//       "address": "123 Lakeside Way",
//       "phone": "16503600708",
//       "prices": [
//         {
//           "Cafe Latte": 4.75,
//           "Flat White": 4.75,
//           "Cappucino": 3.85,
//           "Single Espresso": 2.05,
//           "Double Espresso": 3.75,
//           "Americano": 3.75,
//           "Cortado": 4.55,
//           "Tea": 3.65,
//           "Choc Mudcake": 6.40,
//           "Choc Mousse": 8.20,
//           "Affogato": 14.80,
//           "Tiramisu": 11.40,
//           "Blueberry Muffin": 4.05,
//           "Chocolate Chip Muffin": 4.05,
//           "Muffin Of The Day": 4.55
//         }
//       ]
//     }
//   ]
//   for(var item in this.order) {
//     price = data[0]['prices'][0][item];
//     this.total = price * (this.order[item]);
//     return this.total;
//   }
// };

// AJAX request must be made over webserver...
Till.prototype.callTotal = function() {
  for(var item in this.order) {
    var amount = this.order[item];
    var url = '../hipstercoffee.json';
    $.getJSON(url, function(data) {
      price = data[0]['prices'][0][item];
    })
    .done(function() {
      this.total = price * amount;
    })
  }
};