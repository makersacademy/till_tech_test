$(document).ready(function() {
  console.log('menu template initiated');

  $.get('/api/location/thecafe/menu/1', function(menu_items) {
    var source   = $('#menu-template').html();
    var template = Handlebars.compile(source);
    var data = { menu_items: menu_items } 

    $('#menu-container').html(template(data));
  });
});
