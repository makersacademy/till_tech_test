$(document).ready(function() {
  console.log('menu template initiated');

  $.get('/api/location/thecafe/menu/1', function(data) {
    var source   = $('#menu-template').html();
    var template = Handlebars.compile(source);
    
    $('#menu-container').html(template(data));
  });
});
