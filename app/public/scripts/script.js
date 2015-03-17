$(document).ready(function() {

  function refreshReceipt() {
    $.get('/api/order/1', function(receiptData) {

      T.render('receiptTemplate', function(receiptTemplate) {
        $('#receipt-container').html( receiptTemplate(receiptData) );
      });
    });
  }

  $.get('/api/location/thecafe/menu/1', function(menu_items) {
    var data = { menu_items: menu_items } 
 
    T.render('menuTemplate', function(menuTemplate) {
      $('#menu-container').html( menuTemplate(data) );
    });
  });

  
  $('#menu-container').on('click', '.menu-items', function() {
    var itemName = $(this).attr('id');
    
    $.post('/api/order/1', { itemname: itemName }, function(data) {
      refreshReceipt();
    });
  })

  $('#payment-form').submit(function( event ) {
    event.preventDefault();
    var paymentValue = $('#payment-form input').first().val();

    $.ajax({
      url: '/api/order/1',
      method: 'PUT',
      data: { 'payment': paymentValue }
    }).done(function() {
      refreshReceipt();
    });
  });
  
  refreshReceipt();
});

