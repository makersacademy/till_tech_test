require 'read_json'

describe ReadJson do
  subject(:readjson) {described_class}
  let(:file_klass) {double(:file_klass)}
  let(:json_klass) {double(:json_klass)}
  context "when ReadJson is passed a filename" do
    before do
      allow(file_klass).to receive(:read).and_return(true)
      allow(json_klass).to receive(:parse).and_return(true)
    end

    it "returns true when the json file was read" do
      mock_filename = "filename"
      expect(readjson.parse(file_klass, json_klass, mock_filename)).to be true
    end
  end

end
