$(document).ready(function() {

  var data;

  $.get('/api/order/1', function(data) {
    console.log(data);
    var source = $('#receipt-template').html();
    var template = Handlebars.compile(source);

    $('#receipt-container').html(template(data));
  });
});

