require 'till'

describe Till do
  it{is_expected.to respond_to :place_order}

  before(:each) do 
    subject.place_order "Cafe Latte"
    subject.place_order "Cafe Latte"
  end 

  it 'can collect orders' do
    expect(subject.customer_order).to eq [{"Cafe Latte"=>4.75}, {"Cafe Latte"=>4.75}]
  end

  it 'can collect prices of ordered items to be calculated' do
    subject.checkout
    expect(subject.customer_bill).to eq [4.75, 4.75]
  end



end

