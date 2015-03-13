require 'helper'

class Tester; include Helper; end

describe Helper do
  
  let(:tester) {Tester.new}

  it "can read to hash from a file" do 
    result=tester.load_json("hipstercoffee.json")
    expect(result['shopName']).to eq("The Coffee Connection")
  end

  it "can send orders to json" do 
  end

end
