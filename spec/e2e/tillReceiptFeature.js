describe('Till receipt', function() {

  beforeEach(function() {
    browser.get('http://localhost:8080');
  });

  it('should have the app name on the page', function() {
  });

  it('should have the menu on the page', function() {
  });

  it('should let the cashier enter the item and quantity', function() {
  	element(by.model("(key, value) in mainCtrl.items")).click("Cappuccino")
  });

  it('should show 4 cappuccinos on receipt when "Added to order"', function() {

  });
});