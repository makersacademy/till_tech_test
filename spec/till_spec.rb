require 'till'

describe Till do

  it 'will have list of items' do
    expect(subject.list.items).to include 'Cappucino'
  end

  it 'can add items to a list' do
    subject.add('Americano', 3)
    expect(subject.order).to include 'Americano'
  end

  it 'will show error if try ordering nn item not in the list' do
    expect{subject.add('English Breakfast Tea', 2)}.to raise_error('Not on menu')
  end

  it 'will calculate price when items are added to the order' do
    subject.add('Americano', 2)
    subject.add('Tiramisu', 1)
    expect(subject.order_value).to eq 18.9
  end

  it 'will show tax on receipt' do
    subject.add('Americano', 2)
    expect(subject.tax).to include '£0.65'
  end

  it 'will display the total value of the order' do
    subject.add('Americano', 2)
    expect(subject.total).to include '£8.15'
  end

  it 'will show the change returned' do
    subject.add('Americano', 2)
    expect(subject.change(10)).to include '£1.85'
  end


end
