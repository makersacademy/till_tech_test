require 'order'

describe Order do

  it 'will contain menu when initialized' do
    expect(subject.menu.menu_list).to include('Americano')
  end

  it 'can be modified by adding items to it' do
    subject.add('Cafe Latte', 2)
    expect(subject.complete_order).to include 'Cafe Latte'
  end

  it 'will return error if item not in menu' do
    expect{subject.add('Cafe', 2)}.to raise_error('Not on menu')
  end

  it 'will update price when added to basket' do
    subject.add('Cafe Latte', 1)
    subject.add('Cafe Latte', 1)
    expect(subject.order_total).to eq 9.5
  end

  it 'will display tax amount on receipt' do
    subject.add('Cafe Latte', 2)
    expect(subject.tax_receipt).to include '£0.82'
  end

  it 'will display the total cost' do
    subject.add('Cafe Latte', 2)
    expect(subject.tax_receipt).to include '£10.32'
  end

  it 'will receive amount and return the change due' do
    subject.add('Cafe Latte', 2)
    expect(subject.payment(15)).to include '£4.68'
  end

end
