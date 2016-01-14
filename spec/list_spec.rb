require 'list'

describe List do

  it 'will have list of items available' do
    expect(subject.items).to include 'Cappucino'
  end

end
