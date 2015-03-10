require './lib/cafe'

describe Cafe do

  it 'calculates a total with sales tax' do
    cafe = Cafe.new(tax: 0.04)

    expect(cafe.calculate(10.0)).to eq 10.4
  end
end

