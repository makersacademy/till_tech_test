require 'read_json'

describe ReadJson do
  subject(:read_json) {described_class}
  let(:file_klass) {double(:file_klass)}
  let(:json_klass) {double(:json_klass)}
  context "when ReadJson is passed a filename" do
    before do
      allow(file_klass).to receive(:read).with(any_args).and_return(:file)
      allow(json_klass).to receive(:parse).with(:file).and_return({"key" => "value"})
    end

    it "returns true when the json file was read" do
      mock_filename = "filename"
      expect(read_json.parse(file_klass, json_klass, mock_filename)).to eq({key: :value})
    end
  end

end
