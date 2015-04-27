require 'till'

feature'As a customer the till' do
  let(:till){Till.new}

  scenario "can take Jane's order of 2 lattes and charge 10.32 incl. tax." do
    till.line_order :latte, 2
    expect(till.sale).to eq 10.32
  end

  scenario "can take John's order of 4 americanos and charge 16.30 incl. tax" do
    till.line_order :americano, 4
    expect(till.sale).to eq 16.30
  end


end