describe('HipTillio', function() {

   beforeEach(function(){
      browser.get('http://localhost:8100');
   });

   var header = element(by.id('hiptillio'))

   it('should have a header with HipTillio', function() {
      expect(header.getText()).toContain('HipTillio');
   });
});