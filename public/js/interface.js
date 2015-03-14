var validate = function(item, quantity, price) {
  var _this = this;
  var count = $('#tillNumbers').children() .length
  if (quantity != 0 && count < 6) {
    addToList(item, quantity, price);
    calculateTotal();   
  }
  else if (count == 6) {
    $("#errorTill").text("Sorry, that is too many orders");
  }
  else {
    $("#errorTill").text("Enter a Quantity");
   }
};

var addToList = function(item, quantity, price) {
  $('#errorTill').empty();
    $.post('/items', {item: item, quantity: quantity}, function(data) { 
      button = item + " x" + quantity + "= " + (price*quantity).toFixed(2)
       + " " + '<button class="btn x" id="'+ item +'">x</button>';
    $('<div />',{html: button}).appendTo('#tillNumbers');
    });
};

var calculateTotal = function(){
  $.get('/items', function(data) {
    $('#totalPrice').text("Total: " + data.total)
  });
};

$(document).on('ready', function() {

  $(document).on('click', '#buttonForAdd', function(e) {
      e.preventDefault();
      $('.receiptPlacement').addClass('receipt1')
      $('#printReceipt').removeAttr('hidden')
      validate($( "#itemselect" ).val(), $("#quantityInput").val(),
       $("#itemselect :selected").attr("id"));
      
    });
  
  $(document).on('click', '.receiptPlacement', function(e) {
    e.preventDefault();
    $('.overView').addClass('receipt2')
  });

  $(document).on('click', '.overView', function(e) {
    e.preventDefault();
    $('.overView').removeClass('receipt2')
  });

  $(document).on('click', '.x', function(e) {
   e.preventDefault();
   $(this).parent().remove();
   $('#entryTill').removeAttr('disabled');
  });

});