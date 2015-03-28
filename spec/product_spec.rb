require 'product'

describe 'Product' do 

  let(:product){Product.new(name: "Blueberry Muffin", price: 4.05)}
  
  it "has a name" do
    expect(product.name).to eq "Blueberry Muffin"
  end

  it "has a price" do
    expect(product.price).to eq 4.05
  end

end
