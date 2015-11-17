require 'menu'

describe Menu do

  it 'will contain a menu when initialized' do
    expect(subject.menu_list).to include 'Cafe Latte'
  end

end
