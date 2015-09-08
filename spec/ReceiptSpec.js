describe('Receipt', function() {

  var receipt;

  describe('shows', function() {

    it('shop details', function() {
      receipt = new Receipt(hipsterCoffeeDetails);
      expect(receipt.shopName).toContain('The Coffee Connection');
      expect(receipt.address).toContain('123 Lakeside Way');
      expect(receipt.phoneNumber).toContain('16503600708');
    });
  });
});
