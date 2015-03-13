require 'helper_json'

class Tester; include Helper_json; end

describe Helper_json do
  
  let(:tester) {Tester.new}



  it "can read to hash from a file" do 
    result=tester.load_json("hipstercoffee.json")
    expect(result['shopName']).to eq("The Coffee Connection")
  end


end
