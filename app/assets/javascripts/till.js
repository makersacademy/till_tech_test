$(document).ready(function(){
  var items;
  var menu;
  var prices;
  var total = 0;

  $('#receipt-message').hide();

  $.getJSON('/hipstercoffee.json', function(data) {
    menu = data;
  })
  .done(function() {
    $('#shop-name').text(menu[0].shopName);
    items = Object.keys(menu[0].prices[0])
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
      var price = menu[0].prices[0]
      price = price[item]
      $('#item-display').append(button[0].value + " £" + price.toFixed(2) + "<br>")
      total += price
      $('#total').html('<h3>' + 'Total: £' + total.toFixed(2) + '</h3>')
  });

  $('#print-receipt').click(function() {
    $('#receipt-message').show();
  });

  $('.number').click(function() {
    $('#payment').append($(this)[0].value)
  });

  $('#pay').click(function() {
    var amount = $('#payment').html();
    // console.log(amount)
    window.location.href = "/till/new?amount=" + amount;
  })

});
