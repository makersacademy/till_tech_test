function DB(cBack) {
  this.db = { '1': {id: '1', name: "Cafe Latte",
                category: "Coffee", price: 4.75},
              '2': {id: '2', name: "Flat White",
                category: "Coffee", price: 4.75},
              '3': {id: '3', name: "Cappucino",
                category: "Coffee", price: 3.85},
              '4': {id: '4', name: "Single Espresso",
                category: "Coffee", price: 2.05},
              '5': {id: '5', name: "Americano",
                category: "Coffee", price: 3.75},
              '6': {id: '6', name: "Cortado",
                category: "Drinks", price: 4.55},
              '7': {id: '7', name: "Tea",
                category: "Drinks", price: 3.65},
              '8': {id: '8', name: "Choc Mudcake",
                category: "Dessert", price: 6.40},
              '9': {id: '9', name: "Chock Mousse",
                category: "Dessert", price: 8.20},
              '10': {id: '10', name: "Affogato",
                category: "Dessert", price: 14.80},
              '11': {id: '11', name: "Tiramisu",
                category: "Dessert", price: 4.05},
              '12': {id: '12', name: "Blueberry Muffin",
                category: "Dessert", price: 4.05},
              '13': {id: '13', name: "Chocolate Chip Muffin",
                category: "Dessert", price: 4.55},
              '14': {id: '14', name: "Muffin Of The Day",
                category: "Dessert", price: 4.55}
            };
    var cBack = (cBack || function() {})();
}

DB.prototype.allItems = function() {
  var items = [];
  for (var id in this.db) {
    items.push(this.db[id]);
  }
  return items.sort(function(a, b) { return a.id - b.id });
};

module.exports = DB;