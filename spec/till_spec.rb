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

  it 'it can calculate the bill' do
    subject.checkout
    subject.totals
    expect(subject.total).to eq 9.50
  end

  it 'it can add tax to the bill' do
    subject.checkout
    subject.totals
    expect(subject.tax).to eq 0.82
  end

  it 'can print receipts with the customers order, tax and total' do
    subject.checkout
    subject.totals
    expect(subject.print_receipt).to eq [{"Cafe Latte"=>4.75}, {"Cafe Latte"=>4.75}, {"Tax"=>0.82}, {"Total"=>9.50}]
  end
end

