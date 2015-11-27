require 'order'

describe Order do

  let(:order) { described_class.new( { server: "Jane", items: { "Cafe Latte"=> 2, "Flat White"=> 1 }  } ) }

  it 'is has a server' do
    expect(order.server).to eq("Jane")
  end

  it 'has items' do
    expect(order.items).to eq( { "Cafe Latte"=>2, "Flat White"=>1 } )
  end
end
