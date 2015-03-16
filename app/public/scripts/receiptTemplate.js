$(document).ready(function() {
  console.log('jquery initiated');

  var test_data = jQuery.parseJSON("{\"order\":{\"items\":[{\"name\":\"Champagne\",\"price\":100.0,\"cost\":100.0,\"discount\":\"0%\",\"quantity\":1},{\"name\":\"Spaghetti\",\"price\":10.0,\"cost\":10.0,\"discount\":\"0%\",\"quantity\":1}],\"total\":110.0},\"discount\":{\"total\":-10.0,\"discount\":\"10%\"},\"total\":90.0}");

  var source = $('#receipt-template').html();
  var template = Handlebars.compile(source);

  $('#receipt-container').html(template(test_data));

});

