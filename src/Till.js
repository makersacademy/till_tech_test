var Till = function() {
  this.detailsList = hipsterCoffeeDetails;
  this.orderedItems = [];
  this.subTotal = 0;
};

Till.prototype.retrievePrice = function(item) {
  return this.detailsList[0].prices[0][item];
};

Till.prototype.addItem = function(item) {
  this.subTotal += this.retrievePrice(item);
  this.orderedItems.push(item);
  return item;
};

Till.prototype.calculateSubTotal = function() {
  return this.subTotal;
};

Till.prototype.calculateTax = function(totalOrderValue) {
  var tax = totalOrderValue * 0.0864;
  return Math.round(tax * 100) / 100;
};

Till.prototype.printOrder = function() {
  var order = this.orderedItems.reduce(function(acc, curr) {
    if (typeof acc[curr] == 'undefined') {
      acc[curr] = 1;
    } else {
      acc[curr] += 1;
    }
    return acc;
  }, {});
  return order;
};

Till.prototype.calculateTotalBill = function() {
  var totalBill = this.subTotal;

  if(this.subTotal > 50) {
    totalBill = this.applyFivePercentDiscount(totalBill);
  }
  if(this.isMuffinInOrder()) {
    totalBill -= this.applyMuffinDiscount();
    totalBill = Math.round(totalBill * 100) / 100;
  }
  return totalBill;
};

Till.prototype.isMuffinInOrder = function() {
  return (this.orderedItems.indexOf('Muffin Of The Day') > -1 || this.orderedItems.indexOf('Chocolate Chip Muffin') > -1 || this.orderedItems.indexOf('Blueberry Muffin') > -1);
};

Till.prototype.applyFivePercentDiscount = function(bill) {
  var billAfterFivePercentDiscount = bill * 0.95;
  return Math.round(billAfterFivePercentDiscount * 100) / 100;
};

Till.prototype.applyMuffinDiscount = function() {
  var muffinDiscount = 0;
  var items = this.orderedItems;
  var details = this.detailsList;
  for(var i = 0; i < items.length; i++) {
      console.log(items[i]);
    if ((items[i] === 'Muffin Of The Day') || (items[i] ==='Blueberry Muffin') || (items[i] ==='Chocolate Chip Muffin')) {
      muffinDiscount += (0.1 * details[0].prices[0][items[i]]);
    }
  }
  return muffinDiscount;
};

Till.prototype.calculateChange = function (cash,billTotal) {
  if (cash < billTotal) {
    return 'Not enough cash given';
  }
  else {
    return cash - billTotal;
  }
};
