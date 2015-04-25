require 'till'

feature 'customer makes an order' do

  scenario 'customer orders one latte' do
    till = Till.new
    till.order :latte
    expect(till.checkout).to eq '4.75'
  end

end