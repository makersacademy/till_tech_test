require 'till'
require 'timecop'

describe Till do

  let(:till) { described_class.new( { shopName: "The Coffee Connection",
                                      address: "123 Lakeside Way",
                                      phone: "16503600708",
                                      prices: { "Cafe Latte"=> 4.75, "Flat White"=> 4.75 }
                                     } ) }

  let(:order) { double(:order, customers: ["Jane", "John"], 
                               items: ["Cafe Latte", "Cafe Latte", "Flat White"],
                               table: 1 ) }

  describe '#process_order' do

    it 'produces receipt with time' do
      Timecop.freeze(Time.local(2015, 10, 10, 8, 0))
      expect(till.process_order(order)[:time]).to eq("2015.10.10 08:00:00")
    end

    it 'produces receipt with cafe name' do
      expect(till.process_order(order)[:name]).to eq("The Coffee Connection")
    end

    it 'produces receipt with table number' do
      expect(till.process_order(order)[:table]).to eq(1)
    end

    it 'produces receipt with address' do
      expect(till.process_order(order)[:address]).to eq("123 Lakeside Way")
    end

    it 'produces receipt with phone number' do
      expect(till.process_order(order)[:phone]).to eq("16503600708")
    end

    it 'produces receipt with customer name' do
      expect(till.process_order(order)[:customers]).to eq(["Jane", "John"])
    end

    it 'produces receipt with each items quanitity and cost' do
      expect(till.process_order(order)[:items]).to eq([ { name: "Cafe Latte",
                                                            quantity: 2,
                                                            price: 4.75
                                                           },
                                                           {
                                                            name: "Flat White",
                                                            quantity: 1,
                                                            price: 4.75 } ])
    end

    it 'produces receipt with total cost' do
      expect(till.process_order(order)[:total]).to eq(15.48)
    end

    it 'produces receipt with tax amount' do
      expect(till.process_order(order)[:tax]).to eq(1.23)
    end
  end

end
