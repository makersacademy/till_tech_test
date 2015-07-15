$(document).ready(function(){

  var menu;
  var prices;
  var total = 0;

  $('#receipt-message').hide();
  $('#pay').hide();
  $('.number').attr('disabled', 'disabled');

  $.getJSON('/hipstercoffee.json', function(data) {
    menu = data;
  })
  .done(function() {
    $('#shop-name').text(menu[0].shopName);
    var items = Object.keys(menu[0].prices[0])
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
    var item = $(this)[0].value
    $.ajax({ url: '/till',
      type: 'POST',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: { "item" : item }
    });
      var price = menu[0].prices[0]
      price = price[item]
      $('#item-display').append(item + " £" + price.toFixed(2) + "<br>")
      total += price
      $('#total').html('<h3>' + 'Total: £' + total.toFixed(2) + '</h3>')
      $('.number').removeAttr('disabled');
      var amount = $('#payment').html();
      amount = amount.substring(1)
      amount = parseFloat(amount)
      if(amount < total) {
        $('#pay').fadeOut(1000);
      }
  });

  $('#print-receipt').click(function() {
    $('#receipt-message').show();
  });

  $('.number').click(function() {
    $('#payment').append($(this)[0].value)
      var amount = $('#payment').html();
      amount = amount.substring(1)
      amount = parseFloat(amount)
      if(amount >= total && total != 0) {
        $('#pay').fadeIn(1000);
      }
  });

  $('#pay').click(function() {
    var tender = $('#payment').html();
    window.location.href = "/till/new?tender=" + tender;
  });

  $('#clear').click(function() {
    $('#payment').html('£');
    $('#pay').fadeOut(1000);
  });

});
