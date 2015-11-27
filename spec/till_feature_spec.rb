cafe_details = [
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
  }
]

order = { server: "Jane", "Cafe Latte": 2, "Flat White": 1 }

output_receipt = {
          date: Time.now,
          name: "The Coffee Connection",
          address: "123 Lakeside Way",
          phone: "16503600708",
          server: "Jane",
          items:
          [
            {
             name: "Cafe Latte",
             quantity: 2,
             cost: 9.50
            },
            {
              name: "Flat White",
              quantity: 1,
              cost: 4.75
            }
          ],
          total: 14.25
        }


describe 'till' do

  it 'creates receipt with cost and cafe details' do
    expect(till.place_order(order).to eq(output_receipt)
  end

end

