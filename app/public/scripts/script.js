$(document).ready(function() {
  var receiptSource   = $('#receipt-template').html();
  var receiptTemplate = Handlebars.compile(receiptSource);
  var menuSource      = $('#menu-template').html();
  var menuTemplate    = Handlebars.compile(menuSource);


  function refreshReceipt() {
    $.get('/api/order/1', function(data) {
      $('#receipt-container').html(receiptTemplate(data));
    });
  }
  
  $('#menu-container').on('click', '.menu-items', function() {
    var idName = $(this).attr('id');
    
    $.post('/api/order/1', { itemname: idName }, function(data) {
      refreshReceipt();
    });
  })


  $.get('/api/location/thecafe/menu/1', function(menu_items) {
    var data = { menu_items: menu_items } 
    $('#menu-container').html(menuTemplate(data));
  });

  refreshReceipt();
});

