var validate = function(item, quantity, price) {
  var _this = this;
  var count = $('#tillNumbers').children().length
  if (quantity != 0 && count < 6) {
    isRepeated(item, quantity, price);
    calculateTotal();   
  }
  else if (count == 6) {
    $("#errorTill").text("Sorry, that is too many orders");
  }
  else {
    $("#errorTill").text("Enter a Quantity");
   }
};

var isRepeated = function(item, quantity, price) {
  $.post('/items', {item: item, quantity: quantity}, function(data) { 
    if($("." + item.replace(/\s+/g, '')).length == 0) {
      addToList(item, quantity, price)
    }
    else {
      appendList(item, quantity, price)
    }
  });
};


var addToList = function(item, quantity, price) {
  $('#errorTill').empty();  
      button = item + " x" + quantity + "= " + (price*quantity).toFixed(2)
       + " " + '<button class="btn x '+ item.replace(/\s+/g, '') +'" id="'+ quantity
       +'">x</button>';
    $('<div />',{html: button}).appendTo('#tillNumbers');    
};

var appendList = function(item, quantity, price) {
  var id = $("."+item.replace(/\s+/g, '')).attr('id') 
  $("."+item.replace(/\s+/g, '')).parent().remove()
  $.get('/items', function(data) {
   button = item + " x" + (+quantity + +id) + "= "
   + (price*(+quantity + +id)).toFixed(2)
   + " " + '<button class="btn x '+ item.replace(/\s+/g, '')
   +'" id="'+ (+quantity + +id) +'">x</button>';
    $('<div />',{html: button}).appendTo('#tillNumbers');
  });
};

var calculateTotal = function(){
  $.get('/total', function(data) {
    $('#totalPrice').text("Total: " + data.total)
  });
};

var deleteItem = function(item){
 $.ajax({
        url: '/items',
        type: 'DELETE',
        data: {item: item},
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
     var item = $(this).attr("id")
     deleteItem(item);
     $(this).parent().remove();
     calculateTotal(); 
  });  
});
