describe('HipTillio', function() {

   beforeEach(function(){
      browser.get('http://localhost:8100');
   });

   var addOrderButton = element(by.id('addOrder'))
   var addOrderField = element(by.model('HipTillCtrl.item'))
   var confirmOrderButton = element(by.className('button-assertive'))
   var addCustomerPaymentButton = element(by.id('addPayment'))
   var addCustomerPaymentField = element(by.model('HipTillCtrl.customerPayment'))
   var addCustomerDiscountField = element(by.model('HipTillCtrl.customerDiscount'))
   var longlistItems = element.all(by.repeater('item in HipTillCtrl.orderItems'));
   var finalorderItems = element.all(by.repeater('item in HipTillCtrl.confirmedItems'));
   var cash = element(by.id('cash'))
   var change = element(by.id('change'))
   var taxCost = element(by.id('taxcost'))
   var totalCost = element(by.id('totalcost'))
   var resetOrderButton = element(by.className('button-dark'))
   // var ptor = protractor.getInstance(),
   //      button;

   it('displays a list of added items with names and prices for an order as being built', function() {
      addOrderField.sendKeys('Americano')
      addOrderButton.click()
      expect(longlistItems.get(0).getText()).toEqual('Americano, 3.75');
   });

   it('displays the item name, price and quantity when order is completed', function() {
      //asychronicity issue - how resolve?
      addOrderField.sendKeys('Americano')
      addOrderButton.click()
      // addOrderField.sendKeys('Cafe Latte')
      // addOrderButton.click()
      confirmOrderButton.click()
      expect(finalorderItems.get(0).getText()).toEqual('Americano, 3.75 * 1');
      // expect(finalorderItems.get(1).getText()).toEqual('Cafe Latte, 4.75 * 1');
   });

   it('displays the total cost of food items before tax when order is completed', function() {
      //asychronicity issue - how resolve?
      addOrderField.sendKeys('Americano')
      addOrderButton.click()
      // addOrderField.sendKeys('Cafe Latte')
      // addOrderButton.click()
      confirmOrderButton.click()
      expect(totalCost.getText()).toContain('3.75')
   });

   it('displays the amount of tax due on a particular order', function() {
       addOrderField.sendKeys('Americano')
       addOrderButton.click()
       confirmOrderButton.click()
       expect(taxCost.getText()).toContain('0.32')
   });

   it('displays the amount of cash given and change due after customer has provided payment', function() {
       addOrderField.sendKeys('Americano')
       addOrderButton.click()
       addCustomerPaymentField.sendKeys('4.00')
       addCustomerPaymentButton.click()
       confirmOrderButton.click()

       expect(cash.getText()).toContain('4.00')
       expect(change.getText()).toContain('0.25')
   });

   it('displays total after a discount is applied', function() {
       addOrderField.sendKeys('Americano')
       addOrderButton.click()
       addCustomerPaymentField.sendKeys('4.00')
       addCustomerDiscountField.sendKeys('5')
       addCustomerPaymentButton.click()
       confirmOrderButton.click()
       expect(totalCost.getText()).toContain('3.56')
   });

   it('allows barista to reset till and process a new order receipt', function() {
       addOrderField.sendKeys('Cafe Latte')
       addOrderButton.click()
       addCustomerPaymentField.sendKeys('5.00')
       addCustomerDiscountField.sendKeys('5')
       addCustomerPaymentButton.click()
       confirmOrderButton.click()
       expect(totalCost.getText()).toContain('4.51')
       expect(taxCost.getText()).toContain('0.39')
       expect(cash.getText()).toContain('5.00')
       expect(change.getText()).toContain('0.49')

       resetOrderButton.click()
       expect(totalCost.getText()).toContain('0')
       expect(taxCost.getText()).toContain('0')
       expect(cash.getText()).toContain('0')
       expect(change.getText()).toContain('0')
   })

   xit('prevents barista from adding an item that is not the menu to the order', function() {
       addOrderField.sendKeys('Caffe Latte')
       addOrderButton.click()

   })
});



