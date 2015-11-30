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

  describe '#total' do

    it 'calculates the amount due' do
      expect(till.total(order)).to eq( { amount_due: 15.48 } )
    end

  end

  describe '#take_payment' do

    before do
      till.total(order)
    end

    it 'produces receipt with time' do
      Timecop.freeze(Time.local(2015, 10, 10, 8, 0))
      expect(till.take_payment(15.48)[:time]).to eq("2015.10.10 08:00:00")
    end

    it 'produces receipt with cafe name' do
      expect(till.take_payment(15.48)[:name]).to eq("The Coffee Connection")
    end

    it 'produces receipt with table number' do
      expect(till.take_payment(15.48)[:table]).to eq(1)
    end

    it 'produces receipt with address' do
      expect(till.take_payment(15.48)[:address]).to eq("123 Lakeside Way")
    end

    it 'produces receipt with phone number' do
      expect(till.take_payment(15.48)[:phone]).to eq("16503600708")
    end

    it 'produces receipt with customer name' do
      expect(till.take_payment(15.48)[:customers]).to eq(["Jane", "John"])
    end

    it 'produces receipt with each items quanitity and cost' do
      expect(till.take_payment(15.48)[:items]).to eq([ { item: "Cafe Latte",
                                                            quantity: 2,
                                                            price: 4.75
                                                           },
                                                           {
                                                            item: "Flat White",
                                                            quantity: 1,
                                                            price: 4.75 } ])
    end

    it 'produces receipt with subtotal'  do
      expect(till.take_payment(15.48)[:subtotal]).to eq(14.25)
    end

    it 'produces receipt with total cost' do
      expect(till.take_payment(15.48)[:total]).to eq(15.48)
    end

    it 'produces receipt with tax amount' do
      expect(till.take_payment(15.48)[:tax]).to eq(1.23)
    end

    it'produces receipt with cash paid' do
      expect(till.take_payment(15.48)[:cash]).to eq(15.48)
    end

    it 'produces receipt with change amount' do
      expect(till.take_payment(15.48)[:change]).to eq(0.00)
    end

    context 'when payment is higher than total' do

      it 'gives correct change' do
        expect(till.take_payment(20.00)[:change]).to eq(4.52)
      end

    end

  end

end
