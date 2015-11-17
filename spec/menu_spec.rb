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
    subject.order("Affogato", 2)
    subject.order("Muffin Of The Day", 2)
    subject.prices
    subject.sum
    expect(subject.sum).to eq(38.7)
  end

  it "4. We can see the tax of the final sum of the bill" do
    subject.order("Affogato", 2)
    subject.order("Muffin Of The Day", 1)
    subject.prices
    subject.taxes
    expect(subject.taxes).to eq(2.95)
  end

  it "5. We can see price with 5% discount in case our purchase is more than 50$" do
    subject.order("Affogato", 20)
    subject.order("Muffin Of The Day", 10)
    subject.prices
    expect(subject.sum).to eq(324.43)
  end

   it "6. We can see the discount separetaly in our bill" do
     subject.order("Affogato", 20)
     subject.order("Muffin Of The Day", 10)
     subject.prices
     expect(subject.discount).to eq(17.07)
  end

   it "7. We can see the change of the customer" do
    subject.order("Affogato", 20)
    subject.order("Muffin Of The Day", 10)
    subject.prices
    subject.sum
    subject.money(600)
    expect(subject.charge).to eq(275.57)
  end

end
