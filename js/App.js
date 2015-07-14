$(document).ready(function() {
  var till = new Till;
  till.loadDetails()
  .done(function() {
    var order = new Order;
    order.addItem('Cafe Latte');
  });
});