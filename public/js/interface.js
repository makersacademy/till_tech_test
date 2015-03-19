var validate = function(item, quantity, price) {
  var count = $('#tillNumbers').children().length;
  if (quantity != 0 && count < 7) {
    $.post('/items', {item: item, quantity: quantity}, function(data) { 
      addToList();
    });
  }
  else if (quantity == 0){
    $("#errorTill").text("Enter a Quantity");
  }
  else {
    $("#errorTill").text("We can't fill anymore orders");
  }
};

var addToList = function(){
  $.get('/items', function(data) {
     calculateTotal();
     $('#errorTill').empty();  
     $('#tillNumbers').empty();
    var size = +data.item.length;
    for (var i = 0; i < size; i++) {
      button = data.item[i] + " x" + data.quantity[i] + "= £" + (+data.price[i]).toFixed(2)
       + " " + '<button value="'+ data.item[i]
       +'" class="x '+ data.item[i].replace(/\s+/g, '') +'" id="'+ data.quantity[i]
       +'">x</button>';
       $('<div />',{html: button}).appendTo('#tillNumbers');

    }
  });   
};

var calculateTotal = function(){
  $.get('/total', function(data) {
    $('#totalPrice').text("Total: £" + data.total);
    $('#tax').text("Tax (8.64%): £" + data.tax);
    $('#afterTax').text("After Tax: £" + data.after);
  });
};

var deleteItem = function(item){
  $.ajax({
    url: '/items',
    type: 'DELETE',
    data: {item: item},
    success: function() {
      calculateTotal(); 
    }
  });
};

var payTotal = function(money) {
   $.post('/pay', {money: money}, function(data) {
     showTotal()
   }); 
};

var showTotal = function() {
  $.get('/pay', function(data) {
    if (data.money > 0.00) {
      $('#change').text("Change: £" + data.money);
    }
    else {
      $('#change').text("Not enough money");
    }
  });
};

$(document).on('ready', function() {
 
  addToList();
  calculateTotal();
  
  $(document).on('click', '#buttonForAdd', function(e) {
      e.preventDefault();
      validate($( "#itemselect" ).val(), $("#quantityInput").val(),
       $("#itemselect :selected").attr("id"));     
    });

  $(document).on('click', '.x', function(e) {
   e.preventDefault();
     var item = $(this).attr("value");
     deleteItem(item);
     $(this).parent().remove();
  });  


  $(document).on('click', '#pay', function(e) {
   e.preventDefault();
     $('#change').empty();
     $('#entryTill').prop('hidden', 'hidden');
     $('#buttonForAdd').prop('hidden', 'hidden');
     $('#pay').prop('hidden', 'hidden');
     $('.payForm').removeAttr('hidden')
     
  });

  $(document).on('click', '#getChange', function(e) {
   e.preventDefault();
     var money = $( "#payInput").val()
     payTotal(money)
  });

   $(document).on('click', '#nextCustomer', function(e) {
   e.preventDefault();
     $('#entryTill').removeAttr('hidden');
     $('#buttonForAdd').removeAttr('hidden');
     $('#pay').removeAttr('hidden');
     $('.payForm').prop('hidden', 'hidden')
  });
});
