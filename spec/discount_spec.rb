require 'discount'

describe Discount do

  let(:discount_amount) { described_class.new( { type: :amount,
                                                 trigger: 10.00,
                                                 percent: 10 
                                               } ) }

  let(:discount_line) { described_class.new( { type: :amount,
                                               line: "Latte",
                                               percent: 5
                                             } ) }

  context 'discount is created as amount type' do

    it 'has amount type' do
      expect(discount_amount.type).to eq(:amount)
    end

    it 'has a trigger' do
      expect(discount_amount.trigger).to eq(10.00)
    end

    it 'has a percent' do
      expect(discount_amount.percent).to eq(10)
    end

  end

  context 'discount is created as line type' do

    it 'has amount type' do
      expect(discount_line.type).to eq(:amount)
    end

    it 'has a trigger' do
      expect(discount_line.line).to eq("Latte")
    end

    it 'has a percent' do
      expect(discount_line.percent).to eq(5)
    end

  end
end
