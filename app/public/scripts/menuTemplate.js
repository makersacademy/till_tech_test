$(document).ready(function() {
  console.log('menu template initiated');
  var test_data = JSON.parse("{\"spaghetti\":{\"name\":\"Spaghetti\",\"price\":5.0}}")

  var source   = $('#menu-template').html();
  var template = Handlebars.compile(source);
  
  $('#menu-container').html(template(test_data));

});
