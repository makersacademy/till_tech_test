require './lib/cafe'

describe Cafe do

  it 'can calculate tax on a value' do
    cafe = Cafe.new(tax: "4%")
    expect(cafe.calculate_tax 100.0).to eq 4.0
  end

end

