require 'till'

describe Till do

  let(:subject) { described_class.new( { name: "The Coffee Connection",
                                         address: "123 Lakeside Way",
                                         phone: "16503600708" } ) }

  it 'intializes with a name' do
    expect(subject.name).to eq('The Coffee Connection')
  end

end
