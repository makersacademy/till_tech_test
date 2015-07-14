$(document).ready(function(){

  var items;
  var order = [];

  $.getJSON('/hipstercoffee.json', function(data) {
    items = data;
  })
  .done(function() {
    $('#shop-name').text(items[0].shopName);
  })

  $('#flat-white').click(function() {
    $('#display').text('4.75');
      $.ajax({ url: '/till',
      type: 'POST',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: { "item" : 'Flat White' }
    });
  });

  $('#print-receipt').click(function() {

  });

});
