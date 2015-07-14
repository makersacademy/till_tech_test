describe('HipTillio', function() {

   beforeEach(function(){
      browser.get('http://localhost:8100');
   });

   var header = element(by.id('hiptillio'))
   var addOrderButton = element(by.id('addOrder'))
   var addOrderField = element(by.model('HipTillCtrl.item'))
   var confirmOrderButton = element(by.className('button-positive'))
   var addCustomerPaymentButton = element(by.id('addPayment'))
   var addCustomerPaymentField = element(by.model('HipTillCtrl.customerPayment'))
   var longlistItems = element.all(by.repeater('item in HipTillCtrl.orderItems'));
   var finalorderItems = element.all(by.repeater('item in HipTillCtrl.confirmedItems'));

   it('has a header with HipTillio', function() {
      expect(header.getText()).toContain('HipTillio');
   });

   it('displays a list of added items with names and prices for an order as being built', function() {
      addOrderField.sendKeys('Americano')
      addOrderButton.click()
      expect(longlistItems.get(0).getText()).toEqual('Americano, 3.75');
   });

   xit('displays the item name, price and quantity when order is completed', function() {
      //asychronicity issue - how resolve?
      addOrderField.sendKeys('Americano')
      addOrderButton.click()
      addOrderField.sendKeys('Cafe Latte')
      addOrderButton.click()
      confirmOrderButton.click()
      expect(finalorderItems.get(0).getText()).toEqual('Americano, 3.75 * 1');
      expect(finalorderItems.get(1).getText()).toEqual('Cafe Latte, 4.75 * 1');
   });

   xit('displays the total cost of food items before tax when order is completed', function() {
      //asychronicity issue - how resolve?
      addOrderField.sendKeys('Americano')
      addOrderButton.click()
      addOrderField.sendKeys('Cafe Latte')
      addOrderButton.click()
      confirmOrderButton.click()

      var totalCost = element(by.id('totalcost'))
      expect(totalCost.getText()).toContain('8.5')
   });

   it('displays the amount of tax due on a particular order', function() {
       addOrderField.sendKeys('Americano')
       addOrderButton.click()
       confirmOrderButton.click()

       var taxCost = element(by.id('taxcost'))
       expect(taxCost.getText()).toContain('0.32')
   });

   it('displays the amount of cash given and change due after customer has provided payment', function() {
       addOrderField.sendKeys('Americano')
       addOrderButton.click()
       addCustomerPaymentField.sendKeys('4.00')
       addCustomerPaymentButton.click()
       confirmOrderButton.click()
       var cash = element(by.id('cash'))
       var change = element(by.id('change'))

       expect(cash.getText()).toContain('4.00')
       expect(change.getText()).toContain('0.25')
   });

   it('displays total after a discount is applied', function() {
       var addCustomerDiscountField = element(by.model('HipTillCtrl.customerDiscount'))
       addOrderField.sendKeys('Americano')
       addOrderButton.click()
       addCustomerPaymentField.sendKeys('4.00')
       addCustomerDiscountField.sendKeys('5')
       addCustomerPaymentButton.click()
       confirmOrderButton.click()
       var totalCost = element(by.id('totalcost'))
       expect(totalCost.getText()).toContain('3.56')
   });
});



