require 'till'

feature'As a customer the till' do
  let(:till){Till.new}

  scenario "can take Jane's order of 2 lattes and charge 9.50" do
    till.line_order :latte, 2
    expect(till.sale).to eq 9.5
  end

  scenario "can take John's order of 4 americanos and charge 15.00" do
    till.line_order :americano, 4
    expect(till.sale).to eq 15.00
  end
end