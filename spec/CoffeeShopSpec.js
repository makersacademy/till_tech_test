describe('Till', function () {
  var coffeeShop;

  beforeEach(function(){
    var shopData = 
    {
      "shopName": "The Coffee Connection",
      "address": "123 Lakeside Way",
      "phone": "16503600708",
      "prices": [
        {
          "Cafe Latte": 4.75,
          "Flat White": 4.75,
          "Cappucino": 3.85,
          "Single Espresso": 2.05,
          "Double Espresso": 3.75,
          "Americano": 3.75,
          "Cortado": 4.55,
          "Tea": 3.65,
          "Choc Mudcake": 6.40,
          "Choc Mousse": 8.20,
          "Affogato": 14.80,
          "Tiramisu": 11.40,
          "Blueberry Muffin": 4.05,
          "Chocolate Chip Muffin": 4.05,
          "Muffin Of The Day": 4.55
        }
      ]
    };
    coffeeShop = new CoffeeShop(shopData);
  });

  describe('has a menu', function () {
    
    it('with items provided', function () {
      expect(coffeeShop.hasItem("Tea")).toBe(true);
    });

    it('without other items', function () {
      expect(coffeeShop.hasItem("Brownie")).toBe(false);
    });

  });

  describe('when taking an order', function () {

    it('can add items to the order', function () {
      coffeeShop.addItem("Tea");
      coffeeShop.addItem("Cortado");
      expect(coffeeShop.orderCount()).toBe(2);
    });

    it('cannot add items that are not on the menu to the order', function () {
      coffeeShop.addItem("Tea");
      coffeeShop.addItem("Tea");
      coffeeShop.addItem("Brownie");
      expect(coffeeShop.orderCount()).toBe(1);
    });

  });

  describe('when calculating the total', function () {

    it('should be zero to start with', function () {
      expect(coffeeShop.total).toEqual(0);
    });

    it('should give a total with tax', function () {
      coffeeShop.addItem("Tea");
      coffeeShop.addItem("Tiramisu");
      coffeeShop.addItem("Tiramisu");
      expect(coffeeShop.getTotalAfterTax()).toEqual(28.74);
    });

    it('should accept a payment and return the change', function () {
      coffeeShop.addItem("Single Espresso");
      coffeeShop.acceptPayment(2.25)
      expect(coffeeShop.change).toEqual(.20);
    });

  });

  describe('when adding discount', function () {
    it('should accept a basic discount', function() {
      coffeeShop.addItem("Tiramisu");
      coffeeShop.applyDiscount(10);
      expect(coffeeShop.discount).toEqual(10);
    });

    it('should appply the discount to the total', function() {
      coffeeShop.addItem("Tiramisu");
      totalBeforeDiscount = coffeeShop.getTotalAfterTax();
      coffeeShop.applyDiscount(10);
      totalAfterDiscount = coffeeShop.getTotalAfterTax();
      expect(totalBeforeDiscount).toBeGreaterThan(totalAfterDiscount);
    });

  });
});