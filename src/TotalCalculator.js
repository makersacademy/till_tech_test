var TotalCalculator = function(detailsList, orderedItems, subTotal) {
  this.detailsList = hipsterCoffeeDetails;
  this.orderedItems = orderedItems;
  this.subTotal = subTotal;
};

TotalCalculator.prototype.calculateTotalBill = function () {
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

TotalCalculator.prototype.isMuffinInOrder = function() {
  return (this.orderedItems.indexOf('Muffin Of The Day') > -1 || this.orderedItems.indexOf('Chocolate Chip Muffin') > -1 || this.orderedItems.indexOf('Blueberry Muffin') > -1);
};

TotalCalculator.prototype.applyFivePercentDiscount = function(bill) {
  var billAfterFivePercentDiscount = bill * 0.95;
  return Math.round(billAfterFivePercentDiscount * 100) / 100;
};

TotalCalculator.prototype.applyMuffinDiscount = function() {
  var muffinDiscount = 0;
  var items = this.orderedItems;
  var details = this.detailsList;
  for(var i = 0; i < items.length; i++) {
    if ((items[i] === 'Muffin Of The Day') || (items[i] ==='Blueberry Muffin') || (items[i] ==='Chocolate Chip Muffin')) {
      muffinDiscount += (0.1 * details[0].prices[0][items[i]]);
    }
  }
  return muffinDiscount;
};
