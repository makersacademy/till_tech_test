$(document).ready(function() {

    $('#start-button').click(function(event) {
      var till = new Till;
      till.addCustomerName($('#customer-name').val());
      till.addTableNumber($('#table-number').val());
      event.preventDefault();
    });

});
