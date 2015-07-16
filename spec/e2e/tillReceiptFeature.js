describe('Till receipt', function() {

  beforeEach(function() {
    browser.get('http://localhost:8080');
  });

  it('should have the app name on the page', function() {
    expect(by.element(h1)).toEqual("hipsterTill");
  });
});