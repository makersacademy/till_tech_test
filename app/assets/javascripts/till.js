$(document).ready(function(){

  var items;

  $('#receipt-message').hide();

  $.getJSON('/hipstercoffee.json', function(data) {
    items = data;
  })
  .done(function() {
    $('#shop-name').text(items[0].shopName);
    items = Object.keys(items[0].prices[0])
    for (i = 0; i < items.length; i ++) {
      var button = $('<button/>').attr({
        class: "shop-items",
        value: items[i]
      });
      button.html(items[i])
      $('#middle-col').append(button);
    }
  });

  $('body').on('click', '.shop-items', function() {
    var button = $(this)
    var item = button[0].value
    // $('#display').text('4.75');
      $.ajax({ url: '/till',
      type: 'POST',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: { "item" : item }
    });
      $('#display').append(button[0].value + ", ")
  });

  $('#print-receipt').click(function() {
    $( "#receipt-message" ).dialog({
      modal: true,
      position: {
          my: "right bottom",
          at: "right bottom",
          of: window
        }
    });
  });

});
