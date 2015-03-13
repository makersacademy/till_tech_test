require './lib/tax'

describe Tax do

  it 'calculates value of tax' do
    tax = Tax.new("10%")
    expect(tax.total(10.0)).to eq 1.0
  end

  it 'prints the tax rate, tax value, and total after tax' do
    tax = Tax.new("10%")
    expect(tax.print(50.0)).to eq({ total: 5.0, tax_rate: "10%",
                                    total_after_tax: 55.0})
  end
end

