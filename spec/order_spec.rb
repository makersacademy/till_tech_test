require 'order'

describe Order do

  it 'will be empty when initialized' do
    expect(subject.complete_order).to eq []
  end

  it 'will contain menu when initialized' do
    expect(subject.menu.menu_list).to include('Americano')
  end

  it 'can be modified by adding items to it' do
    subject.add('Cafe Latte')
    expect(subject.complete_order).to include 'Cafe Latte'
  end

  it 'will return error if item not in menu' do
    expect{subject.add('Cafe')}.to raise_error('Not on menu')
  end

end
