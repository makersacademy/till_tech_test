describe('App',function(){

  beforeEach(function(done){
    setTimeout(function() {
      jasmine.getFixtures().fixturesPath = '.';
      loadFixtures('till.html');
      $.holdReady(false);
      value = 0;
      done();
    }, 1);
  });

  describe('page will display on load', function() {
    it('page title', function() {
      expect($('#title')).toContainText('Hipster Coffee Shop Till');
    });
  });

  // describe('page will display order upon pressing item buttons', function() {
  //   it('1 x Cafe Latte', function() {
  //     $('button#Cafe_Latte').trigger('click');
  //     expect($('#orderItems')).toContainText('Cafe Latte: 1 x $4.75');
  //   });
  // });

});