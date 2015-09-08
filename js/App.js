$(document).ready(function() {
  var till = new Till();
  till.loadDetails()
  .done(function() {
    var order = new Order;

    for(var item in till.menu) {
      var itemButtonID = item.replace(/ /g, '_')
      var itemButton = '<button id="' + itemButtonID + '" class="itemButton" type="button" value="' + item + '">' + item + ': $' + till.menu[item].toFixed(2) + '</button><br>';
      $('#menu').append(itemButton);
    }

    $(".itemButton" ).click(function() {
      console.log('ok');
      order.addItem($(this).val());
      printOrderItems(order);
    });

    function printOrderItems(order) {
      $('#orderItems').text('');
      itemList = till.produceOrderTotal(order)[0];
      for(var item in itemList) {
        quantity = itemList[item]['quantity'];
        price = itemList[item]['price'].toFixed(2);
        $('#orderItems').append(item + ': ' + quantity + ' x $' + price + '<br>');
      }
    }

  });
});