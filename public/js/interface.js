var validate = function(item, quantity, price) {
  var count = $('#tillNumbers').children().length;
  if (quantity != 0 && count < 7 ||
   $("." + item.replace(/\s+/g, '')).length != 0) {
    isRepeated(item, quantity, price);     
  }
  else if (quantity == 0){
    $("#errorTill").text("Enter a Quantity");
  }
  else {
    $("#errorTill").text("We can't fill anymore orders");
  }
  calculateTotal();
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
      button = item + " x" + quantity + "= £" + (price*quantity).toFixed(2)
       + " " + '<button class="btn x '+ item.replace(/\s+/g, '') +'" id="'+ quantity
       +'">x</button>';
    $('<div />',{html: button}).appendTo('#tillNumbers');    
};

var appendList = function(item, quantity, price) {
  $('#errorTill').empty();
  var id = $("."+item.replace(/\s+/g, '')).attr('id') 
  $("."+item.replace(/\s+/g, '')).parent().remove()
   button = item + " x" + (+quantity + +id) + "= £"
   + (price*(+quantity + +id)).toFixed(2)
   + " " + '<button class="btn x '+ item.replace(/\s+/g, '')
   +'" id="'+ (+quantity + +id) +'">x</button>';
    $('<div />',{html: button}).appendTo('#tillNumbers');
};

var calculateTotal = function(){
  $.get('/items', function(data) {
    $('#totalPrice').text("Total: £" + data.total)
    $('#tax').text("Tax (8.64%): £" + data.tax)
    $('#afterTax').text("After Tax: £" + data.after)
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
      validate($( "#itemselect" ).val(), $("#quantityInput").val(),
       $("#itemselect :selected").attr("id"));     
    });

  $(document).on('click', '.x', function(e) {
   e.preventDefault();
     var item = $(this).attr("id")
     deleteItem(item);
     $(this).parent().remove();
     calculateTotal(); 
  });  
});
