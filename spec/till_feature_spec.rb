require 'order'
require 'till'
require 'discount'
require 'timecop'

cafe_data = {
              shopName: "The Coffee Connection",
              address: "123 Lakeside Way",
              phone: "16503600708",
              prices: {
                        "Cafe Latte"=> 4.75,
                        "Flat White"=> 4.75,
                        "Cappucino"=> 3.85,
                        "Single Espresso"=> 2.05,
                        "Double Espresso"=> 3.75,
                        "Americano"=> 3.75,
                        "Cortado"=> 4.55,
                        "Tea"=> 3.65,
                        "Choc Mudcake"=> 6.40,
                        "Choc Mousse"=> 8.20,
                        "Affogato"=> 14.80,
                        "Tiramisu"=> 11.40,
                        "Blueberry Muffin"=> 4.05,
                        "Chocolate Chip Muffin"=> 4.05,
                        "Muffin Of The Day"=> 4.55
                      }
          }


output_receipt = {
          time: "2015.10.10 08:00:00",
          name: "The Coffee Connection",
          address: "123 Lakeside Way",
          phone: "16503600708",
          table: 1,
          customers: ["Jane", "John"],
          items:
          [
            {
             item: "Cafe Latte",
             quantity: 2,
             price: 4.75
            },
            {
              item: "Flat White",
              quantity: 1,
              price: 4.75
            },
            {
              item: "Single Espresso",
              quantity: 1,
              price: 2.05
            },
            {
              item: "Double Espresso",
              quantity: 1,
              price: 3.75
            }
          ],
          subtotal: 20.05,
          tax: 1.73,
          discount: 2.90,
          total: 18.88,
          cash: 30.00,
          change: 11.12
        }


describe 'till' do

  before do
    Timecop.freeze(Time.local(2015, 10, 10, 8, 0))
  end

  context 'when till initialzed with data and prices' do

    till = Till.new(cafe_data)
    order = Order.new( { table: 1 } )
    discount_line = Discount.new( { type: :line,
                                    line: "Espresso",
                                    percent: 50.00
                                  } )

    it 'creates receipt with cost and cafe details' do
      till.add_discount(discount_line)
      order.add_customer("Jane")
      order.add_customer("John")
      order.add_item("Cafe Latte")
      order.add_item("Cafe Latte")
      order.add_item("Flat White")
      order.add_item("Single Espresso")
      order.add_item("Double Espresso")
      till.total(order)
      expect(till.take_payment(30.00)).to eq(output_receipt)
    end

  end

end

