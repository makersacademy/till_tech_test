$(document).ready(function() {

  function refreshReceipt() {
    $.get('/api/order/1', function(data) {

      T.render('receiptTemplate', function(receiptTemplate) {
        $('#receipt-container').html( receiptTemplate(data) );
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

  
  refreshReceipt();
});

