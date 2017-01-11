$(document).ready(function() {

    $('#start-button').click(function(event) {
      var till = new Till;
      till.addCustomerName($('#customer-name').val());
      till.addTableNumber($('#table-number').val());
      event.preventDefault();
      displayMenuSelections();
      $('#start-button').hide();
    });

    var displayMenuSelections = function(){
      var menuSelection = menu[0].prices[0];
      var menuItems = Object.keys(menuSelection);
      menuItems.forEach(menuFunction);
    }

    function menuFunction(item){
      $('#menu').append($('<option value="' + item + '">' + item + '</option>'));
    }


});
