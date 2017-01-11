$(document).ready(function() {

    var till = new Till;

    var displayMenuSelections = function(){
      var menuSelection = menu[0].prices[0];
      var menuItems = Object.keys(menuSelection);
      menuItems.forEach(menuFunction);
    }

    function menuFunction(item){
      $('#menu').append($('<option value="' + item + '">' + item + '</option>'));
    }

    displayMenuSelections();

    $('#order-button').click(function(event) {
      till.addCustomerName($('#customer-name').val());
      till.addTableNumber($('#table-number').val());
        if (($('#menu').val()) != 0) {
          till.addOrder($('#menu').val());
        }
      event.preventDefault();
    });

    $('#print-receipt').click(function(){
      var receipt = till.printReceipt();
      var orders = receipt.orders;
      console.log(orders);
        for (var key in receipt) {
          if (key != "orders"){
            $('#receipt').append($('<p>' + key + " : " + receipt[key] + '</p>'));
          } else {
            for (ord in orders){
              $('#receipt').append($('<p>' + ord + " : " + orders[ord][0] + ' @ £' + orders[ord][1] + '</p>'));
            }
          }
        }
    });

});
