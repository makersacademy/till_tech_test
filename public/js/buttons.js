var till = startTill();

$(document).ready( function() {

  // $('#start').on('click', function(){
  //   startTill();
  // });

  $('.product').on('click', function(event){
    event.preventDefault();
    till.calculateTotal($(this).text());
    $('#total').html(till.total);
  });

  $('.create').on('click', function(event){
    event.preventDefault();
    till.createReceipt();
    $('.receipt input').val(JSON.stringify(till.receipt));
  });

  $('.change').on('click', function(event){
    event.preventDefault();
    var note = $('.change input').val();
    $('#total').html(till.calculateChange(note));
  });
});


function printReceipt() {
  $.ajax({ url: '/',
    type: 'POST',
    data: till.receipt,
    success: function(data) {
      console.log(data);
    },
    error: function(error) {
      console.log(error);
    }
  });
};


function startTill() {
  $.ajax({ url: '/prices',
    type: 'GET'
  }).done(function(data){
    till = new Till(data);
    $('#total').html(till.total);
  });
};