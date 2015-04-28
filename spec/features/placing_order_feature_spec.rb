require 'till'

feature'As a customer the till' do
  let(:till){Till.new Receipt}

  scenario "can take Jane's order of 2 lattes and charge 10.32 incl. tax." do
    till.line_order 'Cafe Latte', 2
    expect(till.sale).to eq 10.32
  end

  scenario "can take John's order of 4 americanos and charge 16.30 incl. tax" do
    till.line_order 'Americano', 4
    expect(till.sale).to eq 16.30
  end

  scenario "produces a receipt for Jane's order of 2 x Cafe Latte, 1 x Blueberry Muffin and 1 x Choc Mudcake" do
    till.line_order 'Cafe Latte', 2
    till.line_order 'Blueberry Muffin', 1
    till.line_order 'Choc Mudcake', 1
    expect(till.create_receipt).to include({:header=>{:shopName=>"The Coffee Connection", :address=>"123 Lakeside Way", :phone=>"16503600708"}, :line_orders=>[["Cafe Latte", 2, 9.5], ["Blueberry Muffin", 1, 4.05], ["Choc Mudcake", 1, 6.4]], :total=>{:total=>21.67, :tax=>1.72}})
  end
end