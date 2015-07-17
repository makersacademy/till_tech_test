describe('App',function(){

  beforeEach(function(){
    jasmine.getFixtures().fixturesPath = '.';
    loadFixtures('till.html');
    $.holdReady(false);
  });

  it('displays page title', function(){
    expect($('#title')).toContainText('Hipster Coffee Shop Till');
  });

});