require 'till'

describe Till do
  let(:till) { Till.new }

  it 'loads Shop Name' do
    expect(till.shop_name).to eq 'The Coffee Connection'
  end

  it 'loads Tiramisu & price' do
    expect(till.prices['Tiramisu']).to eq 11.40
  end

  it 'shows a list of prices' do
    expect(till.prices.count).to eq 15 # magic number, load the json in the test
  end
end
