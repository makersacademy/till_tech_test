require 'till'

feature'running up a sale' do

  scenario "can take Jane's order of 2 caffe lattes and charge 9.50" do
    till = Till.new
    till.order(:latte)
    till.order(:latte)
    expect(till.sale).to equal 9.5
  end


end