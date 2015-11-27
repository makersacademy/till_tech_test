require 'till'

describe Till do

  let(:till) { described_class.new( { name: "The Coffee Connection",
                                         address: "123 Lakeside Way",
                                         phone: "16503600708",
                                         prices:
                                                  {
                                                   "Cafe Latte"=> 4.75,
                                                   "Flat White"=> 4.75
                                                  }
                                        } ) }

  let(:order) { double(:order, server: "Jane", items: { "Cafe Latte"=> 2, "Flat White"=> 1 } ) }

  describe '#produce_receipt' do

    it 'produces receipt with cafe name' do
      expect(till.produce_receipt(order)[:name]).to eq("The Coffee Connection")
    end

    it 'produces receipt with address' do
      expect(till.produce_receipt(order)[:address]).to eq("123 Lakeside Way")
    end

    it 'produces receipt with phone number' do
      expect(till.produce_receipt(order)[:phone]).to eq("16503600708")
    end

    it 'produces receipt with server name' do
      expect(till.produce_receipt(order)[:server]).to eq("Jane")
    end

    it 'produces receipt with each items quanitity and cost' do
      expect(till.produce_receipt(order)[:items]).to eq([ { name: "Cafe Latte",
                                                            quantity: 2,
                                                            price: 4.75
                                                           },
                                                           {
                                                            name: "Flat White",
                                                            quantity: 1,
                                                            price: 4.75 } ])
    end

    it 'produces receipt with total cost' do
      expect(till.produce_receipt(order)[:total]).to eq(15.48)
    end

    it 'produces receipt with tax amount' do
      expect(till.produce_receipt(order)[:tax]).to eq(1.23)
    end
  end

end
