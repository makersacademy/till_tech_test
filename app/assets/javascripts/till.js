  var items;
$(document).ready(function(){


  $.getJSON('/hipstercoffee.json', function(data) {
    items = data;
  })
  .done(function() {
    $('#shop-name').text(items[0].shopName);
  })


  $('#flat-white').click(function() {
    $('#display').text('4.75');
  });
});
