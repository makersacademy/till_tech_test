$(document).ready(function() {
  console.log('jquery initiated');

  var test_data = jQuery.parseJSON("{\"order\":{\"items\":[{\"name\":\"Champagne\",\"price\":100.0,\"cost\":100.0,\"discount\":\"5%\",\"quantity\":1},{\"name\":\"Spaghetti\",\"price\":10.0,\"cost\":10.0,\"quantity\":1}],\"total\":110.0},\"discount\":{\"total\":-10.0,\"discount\":\"10%\"},\"total\":90.0}");

  console.log(test_data);

  var source = $('#receipt-template').html();
  var template = Handlebars.compile(source);
  var data = test_data; 
  data.time = new Date().toUTCString(); 

  $('#receipt-container').html(template(data));

});

