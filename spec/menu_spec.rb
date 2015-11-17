require 'menu'


describe Menu do

  it "1. We can see the list of the customer order" do
    subject.order("Affogato")
    subject.order("Muffin Of The Day")
    expect(subject.customer_order).to eq [{"Affogato"=>14.80}, {"Muffin Of The Day"=>4.55}]
  end

  it "2. We can see prices in customer bill" do
    subject.order("Affogato")
    subject.order("Muffin Of The Day")
    subject.prices
    expect(subject.customer_bill).to eq [14.80, 4.55]
  end

  it "3. We can see the final sum of the bill" do
    subject.order("Affogato")
    subject.order("Muffin Of The Day")
    subject.prices
    subject.sum
    expect(subject.sum).to be(19.35)
  end

  it "4. We can see the tax of the final sum of the bill" do
    subject.order("Affogato")
    subject.order("Muffin Of The Day")
    subject.prices
    subject.taxes
    expect(subject.taxes).to be(1.67)
  end

end
