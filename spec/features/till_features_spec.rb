require 'till'

feature 'As a customer ordering food' do 
  scenario 'I order two Lattes' do
    till = Till.new
    till.place_order "Cafe Latte"
    till.place_order "Cafe Latte"
    till.checkout
    till.total
    expect(till.print_receipt).to eq [{"Cafe Latte"=>4.75}, {"Cafe Latte"=>4.75}, {"Tax"=>0.82}, {"Total"=>9.50}]
  end
end