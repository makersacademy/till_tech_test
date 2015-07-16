require 'till'

feature 'As a customer ordering two lattes' do 
  scenario 'I can get a receipt' do
    till = Till.new
    till.place_order "Cafe Latte"
    till.place_order "Cafe Latte"
    till.checkout
    till.totals
    expect(till.print_receipt).to eq [{"Cafe Latte"=>4.75}, {"Cafe Latte"=>4.75}, {"Tax"=>0.82}, {"Total"=>9.50}]
  end
end