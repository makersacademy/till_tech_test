$.getJSON("hipstercoffee.json" , function(data){

    $.each(data[0].prices[0], function(index, price) {
    $('.prices').append(
    $('<option></option>').val(index).html(index)
    );
  });
});