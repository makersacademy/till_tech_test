describe('HipTillio', function() {

   beforeEach(function(){
      browser.get('http://localhost:8100');
   });

   var header = element(by.id('hiptillio'))

   it('should have a header with HipTillio', function() {
      expect(header.getText()).toContain('HipTillio');
   });

   it('should display a list of added items with names and prices in an order', function() {
      //set-up variable to input data into form
      //send keys to the form
      //state expectation for result of what should show in repeating list
   })
});