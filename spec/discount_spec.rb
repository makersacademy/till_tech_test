require './lib/discount'

describe Discount do

  it 'calculates a discount on a total above a given threshold' do
    big_spend_evaluator = proc {|value| value > 30 }
    discount = Discount.new(discount: '10%', discountable?: big_spend_evaluator)

    expect(discount.total 35.0).to eq -3.5 
  end

  it 'prints its values' do
    big_spend_evaluator = proc {|value| value > 30 }
    discount = Discount.new(discount: '10%', discountable?: big_spend_evaluator)

    expect(discount.print 35.0).to eq({ discount: '10%', total: -3.5 })
  end
end

