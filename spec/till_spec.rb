require 'till'

describe Till do

  let(:till) { described_class.new( { name: "The Coffee Connection",
                                         address: "123 Lakeside Way",
                                         phone: "16503600708",
                                         prices: [
                                                  {
                                                   "Cafe Latte": 4.75,
                                                   "Flat White": 4.75
                                                  }
                                                 ]
                                        } ) }

  let(:order) { double(:order, server: "Jane", items: { "Cafe Latte": 2, "Flat White": 1 } ) }

  it 'intializes with a name' do
    expect(till.company_name).to eq('The Coffee Connection')
  end

  it 'intializes with an address' do
    expect(till.address).to eq('123 Lakeside Way')
  end

  it 'intializes with a phone number' do
    expect(till.phone).to eq('16503600708')
  end

  it 'has a list of items with their prices' do
    expect(till.prices).to eq([ { "Cafe Latte": 4.75, "Flat White": 4.75 } ])
  end

  describe '#place_order' do

    it 'produces receipt with cafe name' do
      expect(till.place_order(order)[:name]).to eq("The Coffee Connection")
    end

    it 'produces receipt with address' do
      expect(till.place_order(order)[:address]).to eq("123 Lakeside Way")
    end

    it 'produces receipt with phone number' do
      expect(till.place_order(order)[:phone]).to eq("16503600708")
    end
  end

end
