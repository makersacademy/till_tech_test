var priceList;
var Till;

priceList = [
  {
    "shopName": "The Coffee Connection",
    "address": "123 Lakeside Way",
    "phone": "16503600708",
    "prices": [
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
    ]
  }
];


Till = function () {
  this.priceList = priceList;
  this.taxRate = 8.64;
  this.currentOrder = {};
  this.applyMuffinDiscount = false;
};

Till.prototype.add = function (item) {
  if (this.currentOrder[item]) { this.currentOrder[item] += 1;
    } else {
    this.currentOrder[item] = 1;
  }
  this.total += this.priceList[0].prices[0][item];
};

Till.prototype.calculateMuffinDiscount = function (total) {
  var totalDiscount;
  var itemTotal;
  var key;
  totalDiscount = 0;

  for (key in this.currentOrder) {
    if (key.includes("Muffin")) {
      itemTotal = this.priceList[0].prices[0][key] * this.currentOrder[key];
      totalDiscount += (itemTotal / 100) * 10;
    }
  }
  return (total - totalDiscount);
};

Till.prototype.getTotal = function () {
  var total;
  var key;
  total = 0;
  for (key in this.currentOrder) {
    total += this.priceList[0].prices[0][key] * this.currentOrder[key];
  }
  if (this.applyMuffinDiscount) {
    total = this.calculateMuffinDiscount(total);
  }
  return total.toFixed(2);
};


Till.prototype.getTax = function () {
  var tax = (this.getTotal() / 100) * this.taxRate;
  return tax.toFixed(2);
};

Till.prototype.getLineTotals = function () {
  var returnString;
  var key;

  returnString = "";
  for (key in this.currentOrder) {
    returnString += key + " " + this.currentOrder[key] + " x " + this.priceList[0].prices[0][key].toFixed(2) + "\n";
  }
  return returnString;
};

Till.prototype.pay = function (amount) {
  return (amount - this.getTotal()).toFixed(2);
};

Till.prototype.muffinDiscount = function () {
  this.applyMuffinDiscount = true;
};