require 'menu'


describe Menu do

  it "1. We can see the list of the customer order" do
    subject.order("Affogato",1)
    subject.order("Tea",1)
    expect(subject.customer_order).to eq [{"Affogato"=>14.80}, {"Tea"=>3.65}]
  end

  it "2. We can see prices and quantity of products in customer bill" do
    subject.order("Affogato",1)
    subject.order("Tea",1)
    subject.prices
    expect(subject.customer_bill).to eq [14.80, 3.65]
  end

  it "3. We can see the final sum of the bill" do
    subject.order("Affogato", 10)
    subject.order("Muffin Of The Day", 10)
    subject.prices
    subject.sum
    expect(subject.sum).to be(193.5)
  end

  it "4. We can see the tax of the final sum of the bill" do
    subject.order("Affogato", 10)
    subject.order("Muffin Of The Day", 10)
    subject.prices
    subject.taxes
    expect(subject.taxes).to be(16.72)
  end

  it "5. We can get discount in case our purchase is more than 50$"


end
