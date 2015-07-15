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
    var items = Object.keys(menu[0].prices[0]);
    createItemButtons(items);
  });

  $('body').on('click', '.shop-items', function() {

    var item = $(this)[0].value;
    sendData(item);

    var price = menu[0].prices[0];
    price = price[item];
    $('#item-display').append(item + " £" + price.toFixed(2) + "<br>");

    if ($(this)[0].value.match(/Muffin/)) { price -= muffinDiscount(price); }

    total += price;

    if (total > 50) { total -= bigOrderDiscount(total); }

    $('#total').html('<h3>' + 'Total: £' + total.toFixed(2) + '</h3>');
    $('.number').removeAttr('disabled');
    var amount = $('#payment').html();
    amount = parseFloat(amount.substring(1));
    if(amount < total) { $('#pay').fadeOut(1000); }
  });

  $('.number').click(function() {
    $('#payment').append($(this)[0].value);
    var amount = $('#payment').html();
    amount = parseFloat(amount.substring(1));
    if (amount >= total && total != 0) { $('#pay').fadeIn(1000); }
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

function createItemButtons(items) {
  for (i = 0; i < items.length; i ++) {
    var button = $('<button/>').attr({
      class: "shop-items",
      value: items[i]
    });
    button.html(items[i]);
    $('#middle-col').append(button);
  }
};

function sendData(item) {
  $.ajax({ url: '/till',
    type: 'POST',
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: { "item" : item }
  });
};

function muffinDiscount(price) {
  var discount = (price / 100) * 10;
  $('#item-display').append('10% Muffin Discount -£' + discount.toFixed(2) + "<br>");
  return discount;
};

function bigOrderDiscount(total) {
  var discount = (total / 100) * 5;
  $('#discount').append('5% Discount -£' + discount.toFixed(2));
  return discount;
};
