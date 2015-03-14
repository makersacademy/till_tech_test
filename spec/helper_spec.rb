require 'helper'

class Tester; include Helper; end

describe Helper do
  
  let(:tester) {Tester.new}

  it "can read to hash from a file" do 
    result=tester.load_json("hipstercoffee.json")
    expect(result['shopName']).to eq("The Coffee Connection")
  end

  it "can extract shop details from json" do 
    result=tester.load_json("hipstercoffee.json")
    expect(tester.extractShop(result)).to eq({:shopName=>"The Coffee Connection",:address=>"123 Lakeside Way",:phone=>"16503600708"})
  end



end
