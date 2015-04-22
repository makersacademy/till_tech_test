feature 'As a customer I want to be able to order items from a coffee shop' do

  scenario 'Jane orders 2 cafe lattes' do
    till = Till.new
    till.order :latte
    till.order :latte
    expect(till.cash_out).to eq 9.50
  end

  xscenario 'John orders 4 Americanos'


end
